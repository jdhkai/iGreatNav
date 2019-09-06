package com.igreat.webnav.controller;

import com.igreat.webnav.dto.NavigationFloatDTO;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.service.NavigationFloatService;
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
@RequestMapping("/navigation-float")
@CrossOrigin("*")
public class NavigationFloatController {

    @Resource
    NavigationFloatService navigationFloatService;

    @GetMapping("/list")
    public ResultWrapper findByConditions(@RequestParam(required = false) String keywords,
                                          @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                          @RequestParam(required = false, defaultValue = "0") Integer pageIndex,
                                          @RequestParam(required = false, defaultValue = "0") Integer level) {
        return ResultUtils.success(navigationFloatService.findList(keywords, pageIndex, pageSize,level));
    }

    @PostMapping("/addOrUpdate")
    public ResultWrapper addOrUpdate(@RequestBody @Validated NavigationFloatDTO bannerDTO) {
        ResultWrapper resultWrapper = null;
        if (bannerDTO.getPkId() != null) {
            resultWrapper = navigationFloatService.update(bannerDTO);
        } else {
            resultWrapper = navigationFloatService.add(bannerDTO);
        }
        return resultWrapper;
    }

    @PostMapping("/delete")
    public ResultWrapper delete(@RequestBody Integer[] ids) {
        return navigationFloatService.delete(ids);
    }

}

