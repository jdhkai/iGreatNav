package com.igreat.webnav.service.impl;

import com.igreat.webnav.constant.ErrorCode;
import com.igreat.webnav.domain.NavigationCommon;
import com.igreat.webnav.domain.NavigationFloat;
import com.igreat.webnav.dto.NavigationCommonDTO;
import com.igreat.webnav.dto.NavigationFloatDTO;
import com.igreat.webnav.repository.NavigationCommonDAO;
import com.igreat.webnav.result.PageResult;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.service.NavigationCommonService;
import com.igreat.webnav.service.NavigationFloatService;
import com.igreat.webnav.utils.ResultUtils;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
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
public class NavigationCommonServiceImpl implements NavigationCommonService {

    @Resource
    NavigationCommonDAO commonDAO;

    @Override
    public PageResult findList(String keyword, Integer pageIndex, Integer pageSize) {
        Sort sort = new Sort(Sort.Direction.DESC, "orderValue");
        Pageable pageable = PageRequest.of(pageIndex, pageSize, sort);
        //创建匹配器，即如何使用查询条件
        ExampleMatcher matcher = ExampleMatcher.matching()//构建对象
                .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING)//改变默认字符串匹配方式：模糊查询
                .withIgnoreCase(true)//改变默认大小写忽略方式：忽略大小写
                .withMatcher("name", ExampleMatcher.GenericPropertyMatchers.contains())//采用“包含匹配”的方式查询
                .withMatcher("url", ExampleMatcher.GenericPropertyMatchers.contains())//采用“包含匹配”的方式查询
                .withIgnoreNullValues(); //让空值也参与查询
        NavigationCommon commonEntity = new NavigationCommon();
        commonEntity.setName(keyword);
        commonEntity.setUrl(keyword);

        //创建实例
        Example<NavigationCommon> example = Example.of(commonEntity,matcher);

        Page<NavigationCommon> pages = commonDAO.findAll(example,pageable);

        return new PageResult(pages.getTotalElements(),pages.getContent());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper add(NavigationCommonDTO entityDTO) {
        Date date = new Date();
        NavigationCommon newEntity = new NavigationCommon();
        newEntity.setName(entityDTO.getName());
        newEntity.setUrl(entityDTO.getUrl());
        newEntity.setIcon(entityDTO.getIcon());
        newEntity.setCreatedTime(date);
        newEntity.setOrderValue(entityDTO.getOrderValue()==null?0:entityDTO.getOrderValue());
        //未建立账户体系暂时默认为1
        newEntity.setCreatedBy(1);
        NavigationCommon navigationGet = commonDAO.save(newEntity);
        return ResultUtils.success(navigationGet);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper update(NavigationCommonDTO entityDTO) {
        Optional<NavigationCommon> navigationOptional = commonDAO.findById(entityDTO.getPkId());
        if (navigationOptional.isPresent()) {
            Date date = new Date();
            NavigationCommon newEntity = navigationOptional.get();
            newEntity.setName(entityDTO.getName());
            newEntity.setUrl(entityDTO.getUrl());
            newEntity.setIcon(entityDTO.getIcon());
            newEntity.setUpdatedTime(date);
            newEntity.setOrderValue(entityDTO.getOrderValue()==null?newEntity.getOrderValue():entityDTO.getOrderValue());
            //未建立账户体系暂时默认为1
            newEntity.setUpdatedBy(1);
            NavigationCommon saveEntity = commonDAO.saveAndFlush(newEntity);
            return ResultUtils.success(saveEntity);
        }
        return ResultUtils.fail(ErrorCode.ERROR_OBJECT_NOT_EXIST,"修改的导航不存在");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper delete(Integer[] ids) {
        for (Integer id : ids) {
            Optional<NavigationCommon> navigationOptional = commonDAO.findById(id);
            if (navigationOptional.isPresent()) {
                commonDAO.deleteById(id);
            }
        }
        return ResultUtils.success(null);
    }
}
