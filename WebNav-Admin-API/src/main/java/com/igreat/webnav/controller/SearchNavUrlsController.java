package com.igreat.webnav.controller;

import com.igreat.webnav.dto.SearchUrlDTO;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.service.SearchNavUrlService;
import com.igreat.webnav.utils.ResultUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/29
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
@RestController
@RequestMapping("/search-nav")
@CrossOrigin("*")
public class SearchNavUrlsController {

    @Resource
    SearchNavUrlService searchNavUrlService;

    @GetMapping("/list")
    public ResultWrapper findByConditions(@RequestParam(required = false) String keywords,
                                          @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                          @RequestParam(required = false, defaultValue = "0") Integer pageIndex,
                                          @RequestParam(required = false, defaultValue = "-1") Integer leaderId) {
        return ResultUtils.success(searchNavUrlService.findList(keywords, pageIndex, pageSize,leaderId));
    }

    @PostMapping("/addOrUpdate")
    public ResultWrapper addOrUpdate(@RequestBody @Validated SearchUrlDTO bannerDTO) {
        ResultWrapper resultWrapper = null;
        if (bannerDTO.getPkId() != null) {
            resultWrapper = searchNavUrlService.update(bannerDTO);
        } else {
            resultWrapper = searchNavUrlService.add(bannerDTO);
        }
        return resultWrapper;
    }

    @PostMapping("/delete")
    public ResultWrapper delete(@RequestBody Integer[] ids) {
        return searchNavUrlService.delete(ids);
    }

}
