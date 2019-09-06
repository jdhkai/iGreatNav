package com.igreat.webnav.service.impl;

import com.igreat.webnav.constant.ErrorCode;
import com.igreat.webnav.domain.NavigationCate;
import com.igreat.webnav.domain.NavigationUrls;
import com.igreat.webnav.domain.SearchNavUrls;
import com.igreat.webnav.dto.NavigationCateDTO;
import com.igreat.webnav.repository.NavigationCateDAO;
import com.igreat.webnav.repository.NavigationUrlsDAO;
import com.igreat.webnav.result.PageResult;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.service.NavigationCateService;
import com.igreat.webnav.utils.ResultUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.*;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/29
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
@Service
public class NavigationCateServiceImpl implements NavigationCateService {

    @Resource
    NavigationCateDAO cateDAO;

    @Resource
    NavigationUrlsDAO navigationUrlsDAO;

    @Override
    public PageResult findList(String keyword, Integer parentId) {
        Sort sort = new Sort(Sort.Direction.DESC, "orderValue");
        Specification<NavigationCate> specification = new Specification<NavigationCate>() {
            @Override
            public Predicate toPredicate(Root<NavigationCate> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicates = new ArrayList<>();
                if (!StringUtils.isEmpty(keyword)) {
                    Predicate namePredicate = criteriaBuilder.like(root.get("name").as(String.class),"%"+keyword+"%");
                    Predicate introPredicate = criteriaBuilder.like(root.get("intro").as(String.class),"%"+keyword+"%");
                    predicates.add(criteriaBuilder.or(namePredicate, introPredicate));
                }
                if (parentId > -1) {
                    Predicate catePredicate = criteriaBuilder.equal(root.get("parentId").as(Integer.class), parentId);
                    predicates.add(catePredicate);
                }
                if (predicates.size() == 0) {
                    return null;
                }
                Predicate[] p = new Predicate[predicates.size()];
                return criteriaBuilder.and(predicates.toArray(p));
            }
        };
        List<NavigationCate> lists = cateDAO.findAll(specification, sort);
        return new PageResult((long)lists.size(),lists);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper add(NavigationCateDTO entityDTO) {
        Date date = new Date();
        NavigationCate newEntity = new NavigationCate();
        newEntity.setThemeColor(entityDTO.getThemeColor());
        newEntity.setName(entityDTO.getName());
        newEntity.setIcon(entityDTO.getIcon());
        newEntity.setIntro(entityDTO.getIntro());
        newEntity.setParentId(entityDTO.getParentId());
        newEntity.setLevel(entityDTO.getLevel());
        newEntity.setCreatedTime(date);
        newEntity.setOrderValue(entityDTO.getOrderValue()==null?0:entityDTO.getOrderValue());
        //未建立账户体系暂时默认为1
        newEntity.setCreatedBy(1);
        NavigationCate navigationGet = cateDAO.save(newEntity);
        return ResultUtils.success(navigationGet);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper update(NavigationCateDTO entityDTO) {
        Optional<NavigationCate> navigationOptional = cateDAO.findById(entityDTO.getPkId());
        if (navigationOptional.isPresent()) {
            Date date = new Date();
            NavigationCate newEntity = navigationOptional.get();
            newEntity.setThemeColor(entityDTO.getThemeColor());
            newEntity.setName(entityDTO.getName());
            newEntity.setIcon(entityDTO.getIcon());
            newEntity.setIntro(entityDTO.getIntro());
            newEntity.setParentId(entityDTO.getParentId());
            newEntity.setLevel(entityDTO.getLevel());
            newEntity.setUpdatedTime(date);
            newEntity.setOrderValue(entityDTO.getOrderValue()==null?newEntity.getOrderValue():entityDTO.getOrderValue());
            //未建立账户体系暂时默认为1
            newEntity.setUpdatedBy(1);
            NavigationCate saveEntity = cateDAO.saveAndFlush(newEntity);
            return ResultUtils.success(saveEntity);
        }
        return ResultUtils.fail(ErrorCode.ERROR_OBJECT_NOT_EXIST,"修改的分类不存在");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper delete(Integer[] ids) {
        for (Integer id : ids) {
            Optional<NavigationCate> navigationOptional = cateDAO.findById(id);
            if (navigationOptional.isPresent()) {
                if (navigationOptional.get().getLevel() == 1) {
                    List<NavigationCate> associatedUrls = cateDAO.findAllByParentId(id);
                    if (associatedUrls.size()>0){
                        return ResultUtils.fail(ErrorCode.ERROR_NODE_CONTAIN_ASSOCIATED, String.format("“%s”包含子节点，请清空节点后再重试!", navigationOptional.get().getName()));
                    }
                }
                else if(navigationOptional.get().getLevel() == 2){
                    List<NavigationUrls> allByCateId = navigationUrlsDAO.findAllByCateId(navigationOptional.get().getPkId());
                    if (allByCateId.size() > 0) {
                        return ResultUtils.fail(ErrorCode.ERROR_NODE_CONTAIN_ASSOCIATED, String.format("“%s”包含子节点，请清空节点后再重试!", navigationOptional.get().getName()));
                    }
                }
                cateDAO.deleteById(id);
            }
        }
        return ResultUtils.success(null);
    }
}
