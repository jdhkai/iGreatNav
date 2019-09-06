package com.igreat.webnav.repository;

import com.igreat.webnav.domain.SiteBanner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/28
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
@Repository
public interface BannerDAO extends JpaRepository<SiteBanner,Integer> {
}
