package com.igreat.webnav.exception;

import com.igreat.webnav.constant.ErrorCode;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.utils.ResultUtils;
import org.apache.tomcat.util.http.fileupload.FileUploadBase;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/29
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
@RestControllerAdvice
public class WebNavExceptionHandler {

    private static final Logger logger = LoggerFactory.getLogger(WebNavExceptionHandler.class);

    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public ResultWrapper methodArgumentNoValid(MethodArgumentNotValidException ex) {
        logger.error("捕获到MethodArgumentNotValidException异常",ex);
        BindingResult bindingResult = ex.getBindingResult();
        return ResultUtils.fail(ErrorCode.ERR_PARAMS, bindingResult.getFieldError().getDefaultMessage());
    }

    @ExceptionHandler(value = Exception.class)
    public ResultWrapper globalExceptionHandler(Exception e) {
        logger.error("捕获到Exception异常",e);
        return ResultUtils.fail(ErrorCode.ERR_UNKNOWN, e.getMessage());
    }

    @ExceptionHandler(value = FileUploadBase.SizeLimitExceededException.class)
    public ResultWrapper fileSizeLimitExceptionHandler(FileUploadBase.SizeLimitExceededException e) {
        logger.error("捕获到SizeLimitExceededException异常",e);
        return ResultUtils.fail(ErrorCode.ERROR_FILE_UPLOAD_MAX_LIMIT, "上传的文件超出了指定大小");
    }
}
