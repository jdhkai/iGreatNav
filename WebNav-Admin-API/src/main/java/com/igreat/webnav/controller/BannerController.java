package com.igreat.webnav.controller;

import com.igreat.webnav.dto.BannerDTO;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.service.BannerService;
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
@RequestMapping("/banner")
@CrossOrigin("*")
public class BannerController {

    @Resource
    BannerService bannerService;

    @GetMapping("/list")
    public ResultWrapper findByConditions(@RequestParam(required = false) String keywords,
                                          @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                          @RequestParam(required = false, defaultValue = "0") Integer pageIndex) {
        return ResultUtils.success(bannerService.findList(keywords, pageIndex, pageSize));
    }

    @PostMapping("/addOrUpdate")
    public ResultWrapper addOrUpdate(@RequestBody @Validated BannerDTO bannerDTO) {
        ResultWrapper resultWrapper = null;
        if (bannerDTO.getPkId() != null) {
            resultWrapper = bannerService.update(bannerDTO);
        } else {
            resultWrapper = bannerService.add(bannerDTO);
        }
        return resultWrapper;
    }

    @PostMapping("/delete")
    public ResultWrapper delete(@RequestBody Integer[] ids) {
        return bannerService.delete(ids);
    }

}
