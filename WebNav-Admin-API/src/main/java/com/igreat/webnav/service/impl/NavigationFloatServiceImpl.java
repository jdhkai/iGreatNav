package com.igreat.webnav.service.impl;

import com.igreat.webnav.constant.ErrorCode;
import com.igreat.webnav.domain.NavigationFloat;
import com.igreat.webnav.dto.NavigationFloatDTO;
import com.igreat.webnav.repository.NavigationFloatDAO;
import com.igreat.webnav.result.PageResult;
import com.igreat.webnav.result.ResultWrapper;
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
public class NavigationFloatServiceImpl implements NavigationFloatService {

    @Resource
    NavigationFloatDAO floatDAO;

    @Override
    public PageResult findList(String keyword, Integer pageIndex, Integer pageSize,Integer level) {
        Sort sort = new Sort(Sort.Direction.ASC, "level");
        sort.and(new Sort(Sort.Direction.DESC, "orderValue"));
        Pageable pageable = PageRequest.of(pageIndex, pageSize, sort);
        //创建匹配器，即如何使用查询条件
        ExampleMatcher matcher = ExampleMatcher.matching()//构建对象
                .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING)//改变默认字符串匹配方式：模糊查询
                .withIgnoreCase(true)//改变默认大小写忽略方式：忽略大小写
                .withMatcher("name", ExampleMatcher.GenericPropertyMatchers.contains())//采用“包含匹配”的方式查询
                .withIgnoreNullValues(); //让空值也参与查询
        NavigationFloat floatEntity = new NavigationFloat();
        floatEntity.setName(keyword);
        if (level!=0) {
            floatEntity.setLevel(level);
        }

        //创建实例
        Example<NavigationFloat> example = Example.of(floatEntity,matcher);

        Page<NavigationFloat> pages = floatDAO.findAll(example,pageable);

        return new PageResult(pages.getTotalElements(),pages.getContent());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper add(NavigationFloatDTO entityDTO) {
        Date date = new Date();
        NavigationFloat floatEntity = new NavigationFloat();
        floatEntity.setName(entityDTO.getName());
        floatEntity.setUrl(entityDTO.getUrl());
        floatEntity.setLevel(entityDTO.getLevel());
        floatEntity.setTextColor(entityDTO.getTextColor());
        floatEntity.setCreatedTime(date);
        floatEntity.setOrderValue(entityDTO.getOrderValue()==null?0:entityDTO.getOrderValue());
        //未建立账户体系暂时默认为1
        floatEntity.setCreatedBy(1);
        NavigationFloat navigationFloat = floatDAO.save(floatEntity);
        return ResultUtils.success(navigationFloat);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper update(NavigationFloatDTO entityDTO) {
        Optional<NavigationFloat> floatOptional = floatDAO.findById(entityDTO.getPkId());
        if (floatOptional.isPresent()) {
            Date date = new Date();
            NavigationFloat floatEntity = floatOptional.get();
            floatEntity.setName(entityDTO.getName());
            floatEntity.setUrl(entityDTO.getUrl());
            floatEntity.setLevel(entityDTO.getLevel());
            floatEntity.setTextColor(entityDTO.getTextColor());
            floatEntity.setUpdatedTime(date);
            floatEntity.setOrderValue(entityDTO.getOrderValue()==null?floatEntity.getOrderValue():entityDTO.getOrderValue());
            //未建立账户体系暂时默认为1
            floatEntity.setUpdatedBy(1);
            NavigationFloat saveEntity = floatDAO.saveAndFlush(floatEntity);
            return ResultUtils.success(saveEntity);
        }
        return ResultUtils.fail(ErrorCode.ERROR_OBJECT_NOT_EXIST,"修改的导航不存在");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper delete(Integer[] ids) {
        for (Integer id : ids) {
            Optional<NavigationFloat> floatOptional = floatDAO.findById(id);
            if (floatOptional.isPresent()) {
                floatDAO.deleteById(id);
            }
        }
        return ResultUtils.success(null);
    }
}
