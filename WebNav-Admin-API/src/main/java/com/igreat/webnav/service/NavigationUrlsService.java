package com.igreat.webnav.service;

import com.igreat.webnav.dto.NavigationUrlDTO;
import com.igreat.webnav.dto.SearchUrlDTO;
import com.igreat.webnav.result.PageResult;
import com.igreat.webnav.result.ResultWrapper;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/29
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
public interface NavigationUrlsService {
    /**
     * 查找
     * @param keyword
     * @param pageIndex
     * @param pageSize
     * @return
     */
    public PageResult findList(String keyword, Integer pageIndex, Integer pageSize,Integer cateId);

    /**
     * 添加
     * @param entityDTO
     * @return
     */
    public ResultWrapper add(NavigationUrlDTO entityDTO);

    /**
     * 更新
     * @param entityDTO
     * @return
     */
    public ResultWrapper update(NavigationUrlDTO entityDTO);

    /**
     * 删除
     * @param ids
     * @return
     */
    public ResultWrapper delete(Integer[] ids);
}
