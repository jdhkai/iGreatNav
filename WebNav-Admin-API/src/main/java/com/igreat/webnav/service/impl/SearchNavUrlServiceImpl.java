package com.igreat.webnav.service.impl;

import com.igreat.webnav.constant.ErrorCode;
import com.igreat.webnav.domain.NavigationCommon;
import com.igreat.webnav.domain.SearchNavUrls;
import com.igreat.webnav.dto.SearchUrlDTO;
import com.igreat.webnav.repository.SearchNavUrlsDao;
import com.igreat.webnav.result.PageResult;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.service.SearchNavUrlService;
import com.igreat.webnav.utils.ResultUtils;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
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
public class SearchNavUrlServiceImpl implements SearchNavUrlService {

    @Resource
    SearchNavUrlsDao urlDAO;

    @Override
    public PageResult findList(String keyword, Integer pageIndex, Integer pageSize,Integer leaderId) {
        Sort sort = new Sort(Sort.Direction.DESC, "orderValue");
        Pageable pageable = PageRequest.of(pageIndex, pageSize, sort);
        //创建匹配器，即如何使用查询条件
        ExampleMatcher matcher = ExampleMatcher.matching()//构建对象
                .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING)//改变默认字符串匹配方式：模糊查询
                .withIgnoreCase(true)//改变默认大小写忽略方式：忽略大小写
                .withMatcher("name", ExampleMatcher.GenericPropertyMatchers.contains())//采用“包含匹配”的方式查询
                .withIgnoreNullValues(); //让空值也参与查询
        SearchNavUrls commonEntity = new SearchNavUrls();
        commonEntity.setName(keyword);
        if (leaderId >= 0) {
            commonEntity.setLeaderId(leaderId);
        }

        //创建实例
        Example<SearchNavUrls> example = Example.of(commonEntity,matcher);

        Page<SearchNavUrls> pages = urlDAO.findAll(example,pageable);

        return new PageResult(pages.getTotalElements(),pages.getContent());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper add(SearchUrlDTO entityDTO) {
        Date date = new Date();
        SearchNavUrls newEntity = new SearchNavUrls();
        newEntity.setUrl(entityDTO.getUrl());
        newEntity.setName(entityDTO.getName());
        newEntity.setIcon(entityDTO.getIcon());
        newEntity.setLeaderId(entityDTO.getLeaderId());
        newEntity.setCreatedTime(date);
        newEntity.setOrderValue(entityDTO.getOrderValue()==null?0:entityDTO.getOrderValue());
        //未建立账户体系暂时默认为1
        newEntity.setCreatedBy(1);
        SearchNavUrls navigationGet = urlDAO.save(newEntity);
        return ResultUtils.success(navigationGet);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper update(SearchUrlDTO entityDTO) {
        Optional<SearchNavUrls> navigationOptional = urlDAO.findById(entityDTO.getPkId());
        if (navigationOptional.isPresent()) {
            Date date = new Date();
            SearchNavUrls newEntity = navigationOptional.get();
            newEntity.setUrl(entityDTO.getUrl());
            newEntity.setName(entityDTO.getName());
            newEntity.setIcon(entityDTO.getIcon());
            newEntity.setUpdatedTime(date);
            newEntity.setOrderValue(entityDTO.getOrderValue()==null?newEntity.getOrderValue():entityDTO.getOrderValue());
            //未建立账户体系暂时默认为1
            newEntity.setUpdatedBy(1);
            SearchNavUrls saveEntity = urlDAO.saveAndFlush(newEntity);
            return ResultUtils.success(saveEntity);
        }
        return ResultUtils.fail(ErrorCode.ERROR_OBJECT_NOT_EXIST,"修改的导航不存在");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper delete(Integer[] ids) {
        for (Integer id : ids) {
            Optional<SearchNavUrls> navigationOptional = urlDAO.findById(id);
            if (navigationOptional.isPresent()) {
                List<SearchNavUrls> associatedUrls = urlDAO.findAllByLeaderId(id);
                if (associatedUrls.size()>0){
                    return ResultUtils.fail(ErrorCode.ERROR_NODE_CONTAIN_ASSOCIATED, String.format("“%s”包含子节点，请清空节点后再重试!", navigationOptional.get().getName()));
                }
                urlDAO.deleteById(id);
            }
        }
        return ResultUtils.success(null);
    }
}
