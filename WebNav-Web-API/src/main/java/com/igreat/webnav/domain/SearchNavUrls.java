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
@Table(name = "search_nav_urls")
public class SearchNavUrls extends BaseModel {
    /**
     * 图标
     */
    private String icon;
    /**
     * 名称
     */
    private String name;
    /**
     * 链接地址
     */
    private String url;
    /**
     * 领导编号;上级领导编号，为0表示该链接为领导链接。即在页面上第一个显示的链接，其它只有在鼠标悬停后再显示
     */
    private Integer leaderId;

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
     * 领导编号;上级领导编号，为0表示该链接为领导链接。即在页面上第一个显示的链接，其它只有在鼠标悬停后再显示
     */
    public Integer getLeaderId() {
        return this.leaderId;
    }

    /**
     * 领导编号;上级领导编号，为0表示该链接为领导链接。即在页面上第一个显示的链接，其它只有在鼠标悬停后再显示
     */
    public void setLeaderId(Integer leaderId) {
        this.leaderId = leaderId;
    }
}
