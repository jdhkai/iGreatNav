package com.igreat.webnav.service;

import com.igreat.webnav.dto.NavigationCateDTO;
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
public interface NavigationCateService {
    /**
     * 查找
     * @param keyword
     * @return
     */
    public PageResult findList(String keyword, Integer parentId);

    /**
     * 添加
     * @param entityDTO
     * @return
     */
    public ResultWrapper add(NavigationCateDTO entityDTO);

    /**
     * 更新
     * @param entityDTO
     * @return
     */
    public ResultWrapper update(NavigationCateDTO entityDTO);

    /**
     * 删除
     * @param ids
     * @return
     */
    public ResultWrapper delete(Integer[] ids);
}
