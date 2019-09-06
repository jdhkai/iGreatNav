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
@Table(name = "navigation_float")
public class NavigationFloat extends BaseModel {
    /**
     * 名称
     */
    private String name;
    /**
     * 链接地址
     */
    private String url;
    /**
     * 颜色;十六进制表示，以#号开头
     */
    private String textColor;
    /**
     * 层;显示在上层还是下层,1表示上层，2表示下层
     */
    private Integer level;

    /**
     * 名称
     */
    public String getName() {
        return this.name;
    }

    /**
     * 名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 链接地址
     */
    public String getUrl() {
        return this.url;
    }

    /**
     * 链接地址
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * 颜色;十六进制表示，以#号开头
     */
    public String getTextColor() {
        return this.textColor;
    }

    /**
     * 颜色;十六进制表示，以#号开头
     */
    public void setTextColor(String textColor) {
        this.textColor = textColor;
    }

    /**
     * 层;显示在上层还是下层,1表示上层，2表示下层
     */
    public Integer getLevel() {
        return this.level;
    }

    /**
     * 层;显示在上层还是下层,1表示上层，2表示下层
     */
    public void setLevel(Integer level) {
        this.level = level;
    }
}
