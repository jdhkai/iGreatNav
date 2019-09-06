package com.igreat.webnav.controller;

import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/28
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
@CrossOrigin(origins = "*")  //简单的处理跨域问题
@RestController
public class IndexController {

    @Autowired
    IndexService indexService;

    @GetMapping("/index/list")
    public ResultWrapper getIndexInfo(){
        return indexService.getIndexInfo();
    }

    @PostMapping("/urls/listByCate")
    public ResultWrapper getUrlsByCate(@RequestParam(name = "cateId",required = true) Integer cateId)
    {
        return indexService.getNavigationUrlByCate(cateId);
    }
}
