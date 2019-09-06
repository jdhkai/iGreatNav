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
public class NavigationUrlDTO {
    private Integer pkId;
    @NotBlank(message = "图标不能为空")
    private String icon;
    @NotBlank(message = "网站简称不能为空")
    private String shortName;
    @NotBlank(message = "网站长名不能为空")
    private String longName;
    @NotBlank(message = "链接不能为空")
    private String url;
    @NotNull
    private Integer orderValue;
    @NotNull
    private Integer cateId;

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

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getLongName() {
        return longName;
    }

    public void setLongName(String longName) {
        this.longName = longName;
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

    public Integer getCateId() {
        return cateId;
    }

    public void setCateId(Integer cateId) {
        this.cateId = cateId;
    }
}
