package com.igreat.webnav.repository;

import com.igreat.webnav.domain.NavigationCate;
import com.igreat.webnav.domain.NavigationUrls;
import com.igreat.webnav.domain.SearchNavUrls;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

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
public interface NavigationCateDAO extends JpaRepository<NavigationCate,Integer>, JpaSpecificationExecutor<NavigationCate> {
    public List<NavigationCate> findAllByParentId(Integer parentId);
}
