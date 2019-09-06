package com.igreat.webnav.repository;

import com.igreat.webnav.domain.NavigationCate;
import com.igreat.webnav.domain.NavigationUrls;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

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
public interface NavigationUrlsDAO extends JpaRepository<NavigationUrls,Integer>, JpaSpecificationExecutor<NavigationUrls> {
    public List<NavigationUrls> findAllByCateId(Integer cateId);
}
