package com.igreat.webnav.repository;

import com.igreat.webnav.domain.NavigationUrls;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/28
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
public interface NavigationUrlsDAO extends JpaRepository<NavigationUrls,Integer> {
    @Modifying
    @Query("select nav from NavigationUrls nav where nav.cateId in (?1)")
    List<NavigationUrls> findUrlsByCates(List<Integer> ids);
}
