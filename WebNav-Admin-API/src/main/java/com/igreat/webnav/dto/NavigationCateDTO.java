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
public class NavigationCateDTO {
    private Integer pkId;
    @NotBlank(message = "名称不能为空")
    private String name;
//    @NotNull(message = "图标不能为空")
    private String icon;
//    @NotNull(message = "分类字体颜色不能为空")
    private String themeColor;
//    @NotNull(message = "intro参数不能为空")
    private String intro;
    @NotNull(message = "orderValue参数不能为空")
    private Integer orderValue;
    @NotNull(message = "parentId参数不能为空")
    private Integer parentId;
    @NotNull(message = "level参数不能为空")
    private Integer level;

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

    public String getThemeColor() {
        return themeColor;
    }

    public void setThemeColor(String themeColor) {
        this.themeColor = themeColor;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Integer getOrderValue() {
        return orderValue;
    }

    public void setOrderValue(Integer orderValue) {
        this.orderValue = orderValue;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "NavigationCateDTO{" +
                "pkId=" + pkId +
                ", name='" + name + '\'' +
                ", icon='" + icon + '\'' +
                ", themeColor='" + themeColor + '\'' +
                ", intro='" + intro + '\'' +
                ", orderValue=" + orderValue +
                ", parentId=" + parentId +
                ", level=" + level +
                '}';
    }
}
