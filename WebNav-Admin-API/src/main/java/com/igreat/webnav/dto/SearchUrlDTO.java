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
public class SearchUrlDTO {
    private Integer pkId;
    @NotBlank(message = "图标不能为空")
    private String icon;
    @NotBlank(message = "网站名称不能为空")
    private String name;
    @NotBlank(message = "链接不能为空")
    private String url;
    @NotNull
    private Integer orderValue;
    @NotNull
    private Integer leaderId;

    public Integer getPkId() {
        return pkId;
    }

    public void setPkId(Integer pkId) {
        this.pkId = pkId;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getOrderValue() {
        return orderValue;
    }

    public void setOrderValue(Integer orderValue) {
        this.orderValue = orderValue;
    }

    public Integer getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(Integer leaderId) {
        this.leaderId = leaderId;
    }
}
