package com.igreat.webnav.utils;

import com.igreat.webnav.result.ResultWrapper;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/28
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
public class ResultUtils {
    public static <T> ResultWrapper returnResult(int code, String msg, T t){
        return new ResultWrapper(code,msg,t);
    }

    /**
     * 请求成功
     * @param t
     * @param <T>
     * @return
     */
    public static <T> ResultWrapper success(T t){
        return returnResult(0,"请求成功",t);
    }

    /**
     * 请求失败
     * @param code
     * @param msg
     * @return
     */
    public static ResultWrapper fail(int code, String msg){
        return returnResult(code, msg, null);
    }
}
