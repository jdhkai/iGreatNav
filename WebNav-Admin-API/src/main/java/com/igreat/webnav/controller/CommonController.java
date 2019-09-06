package com.igreat.webnav.controller;

import com.igreat.webnav.constant.Constants;
import com.igreat.webnav.constant.ErrorCode;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.utils.ResultUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;


/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/31
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
@RestController
@RequestMapping("/common")
@CrossOrigin("*")
public class CommonController {
    private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

    @Value("${app.file.location}")
    private String fileSaveDirectory = null;

    /**
     * 环境目录前缀
     * server : 服务器本地
     * qiniu: 七牛云
     * oss: 阿里云OSS
     */
    @Value("${app.file.suffix}")
    private String envDirSuffix = null;

    @PostMapping("/upload")
    public ResultWrapper uploadFile(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return ResultUtils.fail(ErrorCode.ERROR_FILE_UPLOAD_EMPTY,"上传文件不能为空");
        }
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String filename = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + suffix;
        File saveFile = new File(new File(fileSaveDirectory,envDirSuffix), filename);
        if (!saveFile.getParentFile().exists()) {
            saveFile.getParentFile().mkdirs();
        }
        try {
            file.transferTo(saveFile);
            HashMap map = new HashMap();
            map.put("path", envDirSuffix + filename);
            return ResultUtils.success(map);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return ResultUtils.fail(ErrorCode.ERROR_FILE_UPLOAD_FAIL, "服务器文件保存错误，请重试!");
    }
}
