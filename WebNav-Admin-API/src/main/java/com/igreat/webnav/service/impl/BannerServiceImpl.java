package com.igreat.webnav.service.impl;

import com.igreat.webnav.constant.ErrorCode;
import com.igreat.webnav.domain.SiteBanner;
import com.igreat.webnav.dto.BannerDTO;
import com.igreat.webnav.repository.BannerDAO;
import com.igreat.webnav.result.PageResult;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.service.BannerService;
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
public class BannerServiceImpl implements BannerService {

    @Resource
    BannerDAO bannerDAO;

    @Override
    public PageResult findList(String keyword, Integer pageIndex, Integer pageSize) {
        Sort sort = new Sort(Sort.Direction.DESC, "orderValue");
        Pageable pageable = PageRequest.of(pageIndex, pageSize, sort);
        //创建匹配器，即如何使用查询条件
        ExampleMatcher matcher = ExampleMatcher.matching()//构建对象
                .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING)//改变默认字符串匹配方式：模糊查询
                .withIgnoreCase(true)//改变默认大小写忽略方式：忽略大小写
                .withMatcher("title", ExampleMatcher.GenericPropertyMatchers.contains())//采用“包含匹配”的方式查询
                .withIgnoreNullValues(); //让空值也参与查询
        SiteBanner bannerEntity = new SiteBanner();
        bannerEntity.setTitle(keyword);

        //创建实例
        Example<SiteBanner> example = Example.of(bannerEntity,matcher);

        Page<SiteBanner> pages = bannerDAO.findAll(example,pageable);

        return new PageResult(pages.getTotalElements(),pages.getContent());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper add(BannerDTO bannerDTO) {
        Date date = new Date();
        SiteBanner bannerEntity = new SiteBanner();
        bannerEntity.setTitle(bannerDTO.getTitle());
        bannerEntity.setImage(bannerDTO.getImage());
        bannerEntity.setCreatedTime(date);
        bannerEntity.setOrderValue(bannerDTO.getOrderValue()==null?0:bannerDTO.getOrderValue());
        //未建立账户体系暂时默认为1
        bannerEntity.setCreatedBy(1);
        SiteBanner saveBanner = bannerDAO.save(bannerEntity);
        return ResultUtils.success(saveBanner);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper update(BannerDTO bannerDTO) {
        Optional<SiteBanner> bannerOptional = bannerDAO.findById(bannerDTO.getPkId());
        if (bannerOptional.isPresent()) {
            Date date = new Date();
            SiteBanner bannerEntity = bannerOptional.get();
            bannerEntity.setTitle(bannerDTO.getTitle());
            bannerEntity.setImage(bannerDTO.getImage());
            bannerEntity.setUpdatedTime(date);
            bannerEntity.setOrderValue(bannerDTO.getOrderValue()==null?bannerEntity.getOrderValue():bannerDTO.getOrderValue());
            //未建立账户体系暂时默认为1
            bannerEntity.setUpdatedBy(1);
            SiteBanner saveBanner = bannerDAO.saveAndFlush(bannerEntity);
            return ResultUtils.success(saveBanner);
        }
        return ResultUtils.fail(ErrorCode.ERROR_OBJECT_NOT_EXIST,"修改的广告不存在");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultWrapper delete(Integer[] ids) {
        for (Integer id : ids) {
            Optional<SiteBanner> banner = bannerDAO.findById(id);
            if (banner.isPresent()) {
                bannerDAO.deleteById(id);
            }
        }
        return ResultUtils.success(null);
    }
}
