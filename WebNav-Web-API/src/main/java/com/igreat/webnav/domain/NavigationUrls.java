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
@Table(name = "navigation_urls")
public class NavigationUrls extends BaseModel {
    /**
     * 图标
     */
    private String icon;
    /**
     * 短名称
     */
    private String shortName;
    /**
     * 长名称
     */
    private String longName;
    /**
     * 链接地址
     */
    private String url;

    /**
     * 所属分类编号
     */
    private Integer cateId;

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
     * 短名称
     */
    public String getShortName() {
        return this.shortName;
    }

    /**
     * 短名称
     */
    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    /**
     * 长名称
     */
    public String getLongName() {
        return this.longName;
    }

    /**
     * 长名称
     */
    public void setLongName(String longName) {
        this.longName = longName;
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
     * 所属分类编号
     */
    public Integer getCateId() {
        return this.cateId;
    }

    /**
     * 所属分类编号
     */
    public void setCateId(Integer cateId) {
        this.cateId = cateId;
    }
}
