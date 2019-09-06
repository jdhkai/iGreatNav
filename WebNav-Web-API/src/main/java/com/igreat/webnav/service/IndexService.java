package com.igreat.webnav.service;

import com.igreat.webnav.result.ResultWrapper;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/28
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
public interface IndexService {
    /**
     * 获取首页信息
     * @return
     */
    public ResultWrapper getIndexInfo();

    /**
     * 通过分类获取导航信息
     * @param cateId
     * @return
     */
    public ResultWrapper getNavigationUrlByCate(Integer cateId);
}
