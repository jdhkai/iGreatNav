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
public class NavigationFloatDTO {
    private Integer pkId;
    @NotBlank(message = "名称不能为空")
    private String name;
    @NotBlank(message = "链接地址不能为空")
    private String url;
    @NotBlank(message = "颜色不能为空")
    private String textColor;
    @NotNull(message = "显示位置不能为空")
    private Integer level;
//    @NotBlank(message = "排序值不能为空")
    private Integer orderValue;

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

    public String getTextColor() {
        return textColor;
    }

    public void setTextColor(String textColor) {
        this.textColor = textColor;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
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
