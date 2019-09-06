package com.igreat.webnav.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/09/03
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
public class NavigationCommonDTO {
    private Integer pkId;
    @NotBlank(message = "图标不能为空")
    private String icon;
    @NotBlank(message = "链接地址不能为空")
    private String url;
    @NotBlank(message = "名称不能为空")
    private String name;
//    @NotBlank(message = "排序值不能为空")
    private Integer orderValue;

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getOrderValue() {
        return orderValue;
    }

    public void setOrderValue(Integer orderValue) {
        this.orderValue = orderValue;
    }

    public Integer getPkId() {
        return pkId;
    }

    public void setPkId(Integer pkId) {
        this.pkId = pkId;
    }
}
