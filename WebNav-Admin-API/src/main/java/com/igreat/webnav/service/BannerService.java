package com.igreat.webnav.service;

import com.igreat.webnav.domain.SiteBanner;
import com.igreat.webnav.dto.BannerDTO;
import com.igreat.webnav.repository.BannerDAO;
import com.igreat.webnav.result.PageResult;
import com.igreat.webnav.result.ResultWrapper;

import java.util.List;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/29
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
public interface BannerService {
    /**
     * 查找轮播图
     * @param keyword
     * @param pageIndex
     * @param pageSize
     * @return
     */
    public PageResult findList(String keyword, Integer pageIndex, Integer pageSize);

    /**
     * 添加轮播图
     * @param bannerDTO
     * @return
     */
    public ResultWrapper add(BannerDTO bannerDTO);

    /**
     * 更新轮播图
     * @param bannerDTO
     * @return
     */
    public ResultWrapper update(BannerDTO bannerDTO);

    /**
     * 删除轮播图
     * @param ids
     * @return
     */
    public ResultWrapper delete(Integer[] ids);
}
