package com.igreat.webnav.controller;

import com.igreat.webnav.dto.NavigationCommonDTO;
import com.igreat.webnav.dto.NavigationFloatDTO;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.service.NavigationCommonService;
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
@RequestMapping("/navigation-common")
@CrossOrigin("*")
public class NavigationCommonController {

    @Resource
    NavigationCommonService navigationCommonService;

    @GetMapping("/list")
    public ResultWrapper findByConditions(@RequestParam(required = false) String keywords,
                                          @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                          @RequestParam(required = false, defaultValue = "0") Integer pageIndex) {
        return ResultUtils.success(navigationCommonService.findList(keywords, pageIndex, pageSize));
    }

    @PostMapping("/addOrUpdate")
    public ResultWrapper addOrUpdate(@RequestBody @Validated NavigationCommonDTO bannerDTO) {
        ResultWrapper resultWrapper = null;
        if (bannerDTO.getPkId() != null) {
            resultWrapper = navigationCommonService.update(bannerDTO);
        } else {
            resultWrapper = navigationCommonService.add(bannerDTO);
        }
        return resultWrapper;
    }

    @PostMapping("/delete")
    public ResultWrapper delete(@RequestBody Integer[] ids) {
        return navigationCommonService.delete(ids);
    }

}
