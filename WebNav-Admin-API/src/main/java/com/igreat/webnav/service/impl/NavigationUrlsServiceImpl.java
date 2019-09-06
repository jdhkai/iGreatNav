package com.igreat.webnav.service.impl;

import com.igreat.webnav.constant.ErrorCode;
import com.igreat.webnav.domain.NavigationUrls;
import com.igreat.webnav.domain.SearchNavUrls;
import com.igreat.webnav.dto.NavigationUrlDTO;
import com.igreat.webnav.dto.SearchUrlDTO;
import com.igreat.webnav.repository.NavigationUrlsDAO;
import com.igreat.webnav.repository.SearchNavUrlsDao;
import com.igreat.webnav.result.PageResult;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.service.NavigationUrlsService;
import com.igreat.webnav.service.SearchNavUrlService;
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
public class NavigationUrlsServiceImpl implements NavigationUrlsService {

    @Resource
    NavigationUrlsDAO urlDAO;

    @Override
    public PageResult findList(String keyword, Integer pageIndex, Integer pageSize,Integer cateId) {
        Sort sort = new Sort(Sort.Direction.DESC, "orderValue");
        Pageable pageable = PageRequest.of(pageIndex, pageSize, sort);
        Specification<NavigationUrls> specification = new Specification<NavigationUrls>() {
            @Override
            public Predicate toPredicate(Root<NavigationUrls> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicates = new ArrayList<>();
                if (!StringUtils.isEmpty(keyword)) {
                    Predicate shortNamePredicate = criteriaBuilder.like(root.get("shortName").as(String.class),"%"+keyword+"%");
                    Predicate longNamePredicate = criteriaBuilder.like(root.get("longName").as(String.class),"%"+keyword+"%");
                    Predicate urlPredicate = criteriaBuilder.like(root.get("url").as(String.class),"%"+keyword+"%");
                    predicates.add(criteriaBuilder.or(shortNamePredicate, longNamePredicate, urlPredicate));
                }
                if (cateId > 0) {
                    Predicate catePredicate = criteriaBuilder.equal(root.get("cateId").as(Integer.class), cateId);
                    predicates.add(catePredicate);
                }
                if (predicates.size() == 0) {
                    return null;
                }
                Predicate[] p = new Predicate[predicates.size()];
                return criteriaBuilder.and(predicates.toArray(p));
            }
        };
        Page<NavigationUrls> pages = urlDAO.findAll(specification, pageable);
        return new PageResult(pages.getTotalElements(),pages.getContent());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper add(NavigationUrlDTO entityDTO) {
        Date date = new Date();
        NavigationUrls newEntity = new NavigationUrls();
        newEntity.setUrl(entityDTO.getUrl());
        newEntity.setShortName(entityDTO.getShortName());
        newEntity.setLongName(entityDTO.getLongName());
        newEntity.setIcon(entityDTO.getIcon());
        newEntity.setCateId(entityDTO.getCateId());
        newEntity.setCreatedTime(date);
        newEntity.setOrderValue(entityDTO.getOrderValue()==null?0:entityDTO.getOrderValue());
        //未建立账户体系暂时默认为1
        newEntity.setCreatedBy(1);
        NavigationUrls navigationGet = urlDAO.save(newEntity);
        return ResultUtils.success(navigationGet);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper update(NavigationUrlDTO entityDTO) {
        Optional<NavigationUrls> navigationOptional = urlDAO.findById(entityDTO.getPkId());
        if (navigationOptional.isPresent()) {
            Date date = new Date();
            NavigationUrls newEntity = navigationOptional.get();
            newEntity.setUrl(entityDTO.getUrl());
            newEntity.setShortName(entityDTO.getShortName());
            newEntity.setLongName(entityDTO.getLongName());
            newEntity.setIcon(entityDTO.getIcon());
            newEntity.setCateId(entityDTO.getCateId());
            newEntity.setUpdatedTime(date);
            newEntity.setOrderValue(entityDTO.getOrderValue()==null?newEntity.getOrderValue():entityDTO.getOrderValue());
            //未建立账户体系暂时默认为1
            newEntity.setUpdatedBy(1);
            NavigationUrls saveEntity = urlDAO.saveAndFlush(newEntity);
            return ResultUtils.success(saveEntity);
        }
        return ResultUtils.fail(ErrorCode.ERROR_OBJECT_NOT_EXIST,"修改的导航不存在");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper delete(Integer[] ids) {
        for (Integer id : ids) {
            Optional<NavigationUrls> navigationOptional = urlDAO.findById(id);
            if (navigationOptional.isPresent()) {
                urlDAO.deleteById(id);
            }
        }
        return ResultUtils.success(null);
    }
}
