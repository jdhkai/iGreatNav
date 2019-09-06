package com.igreat.webnav.constant;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/29
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
public interface ErrorCode {
    /**
     * -1 未知错误
     * 0 成功
     * 1-1000 逻辑错误
     * 1000~ 系统错误
     * 1001 参数错误
     * 1002 上传文件为空
     * 1003 上传文件失败
     * 1004 上传文件大小超过指定大小
     * 1005 操作的对象不存在
     * 1006 节点包含关联关系未解除
     */
    public static final int ERR_UNKNOWN = -1;

    public static final int ERR_SUCCESS = 0;

    public static final int ERR_PARAMS = 1001;

    public static final int ERROR_FILE_UPLOAD_EMPTY = 1002;

    public static final int ERROR_FILE_UPLOAD_FAIL = 1003;

    public static final int ERROR_FILE_UPLOAD_MAX_LIMIT = 1004;

    public static final int ERROR_OBJECT_NOT_EXIST = 1005;

    public static final int ERROR_NODE_CONTAIN_ASSOCIATED = 1006;

}
