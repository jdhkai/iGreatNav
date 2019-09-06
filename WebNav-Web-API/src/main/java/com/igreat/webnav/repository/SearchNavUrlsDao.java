package com.igreat.webnav.repository;

import com.igreat.webnav.domain.SearchNavUrls;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/28
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
public interface SearchNavUrlsDao extends JpaRepository<SearchNavUrls,Integer> {
}
