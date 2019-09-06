package com.igreat.webnav.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/28
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
@Entity
@Table(name = "navigation_cate")
public class NavigationCate extends BaseModel {
    /**
     * 分类名称
     */
    private String name;
    /**
     * 图标
     */
    private String icon;
    /**
     * 主题颜色;以十六进制表示，以#号开头
     */
    private String themeColor;
    /**
     * 简介;简短说明，不宜过长
     */
    private String intro;
    /**
     * 父级标识;顶级为0
     */
    private Integer parentId;
    /**
     * 级别;从0开始
     */
    private Integer level;

    /**
     * 分类名称
     */
    public String getName() {
        return this.name;
    }

    /**
     * 分类名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 图标
     */
    public String getIcon() {
        return this.icon;
    }

    /**
     * 图标
     */
    public void setIcon(String icon) {
        this.icon = icon;
    }

    /**
     * 主题颜色;以十六进制表示，以#号开头
     */
    public String getThemeColor() {
        return this.themeColor;
    }

    /**
     * 主题颜色;以十六进制表示，以#号开头
     */
    public void setThemeColor(String themeColor) {
        this.themeColor = themeColor;
    }

    /**
     * 简介;简短说明，不宜过长
     */
    public String getIntro() {
        return this.intro;
    }

    /**
     * 简介;简短说明，不宜过长
     */
    public void setIntro(String intro) {
        this.intro = intro;
    }

    /**
     * 父级标识;顶级为0
     */
    public Integer getParentId() {
        return this.parentId;
    }

    /**
     * 父级标识;顶级为0
     */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    /**
     * 级别;从0开始
     */
    public Integer getLevel() {
        return this.level;
    }

    /**
     * 级别;从0开始
     */
    public void setLevel(Integer level) {
        this.level = level;
    }
}
