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
@Table(name = "site_banner")
public class SiteBanner extends BaseModel {
    /**
     * 广告标题;长度不超过8个中文字符
     */
    private String title;
    /**
     * 图片;支持jpg/png/gif
     */
    private String image;

    /**
     * 广告标题;长度不超过8个中文字符
     */
    public String getTitle() {
        return this.title;
    }

    /**
     * 广告标题;长度不超过8个中文字符
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 图片;支持jpg/png/gif
     */
    public String getImage() {
        return this.image;
    }

    /**
     * 图片;支持jpg/png/gif
     */
    public void setImage(String image) {
        this.image = image;
    }
}
