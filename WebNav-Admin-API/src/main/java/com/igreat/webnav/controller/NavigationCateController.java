package com.igreat.webnav.controller;

import com.igreat.webnav.aop.HttpAspect;
import com.igreat.webnav.dto.NavigationCateDTO;
import com.igreat.webnav.dto.SearchUrlDTO;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.service.NavigationCateService;
import com.igreat.webnav.utils.ResultUtils;
import org.slf4j.LoggerFactory;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.logging.Logger;

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
@RequestMapping("/navigation-cate")
@CrossOrigin("*")
public class NavigationCateController {
    private final static org.slf4j.Logger logger = LoggerFactory.getLogger(NavigationCateController.class);

    @Resource
    NavigationCateService navigationCateService;

    @GetMapping("/list")
    public ResultWrapper findByConditions(@RequestParam(required = false) String keywords,
                                          @RequestParam(required = false, defaultValue = "-1") Integer parentId) {
        return ResultUtils.success(navigationCateService.findList(keywords,parentId));
    }

    @PostMapping("/addOrUpdate")
    public ResultWrapper addOrUpdate(@RequestBody @Validated NavigationCateDTO bannerDTO) {
        ResultWrapper resultWrapper = null;
        if (bannerDTO.getPkId() != null) {
            resultWrapper = navigationCateService.update(bannerDTO);
        } else {
            resultWrapper = navigationCateService.add(bannerDTO);
        }
        return resultWrapper;
    }

    @PostMapping("/delete")
    public ResultWrapper delete(@RequestBody Integer[] ids) {
        return navigationCateService.delete(ids);
    }

}