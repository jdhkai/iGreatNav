package com.igreat.webnav.service.serviceImpl;

import com.igreat.webnav.domain.*;
import com.igreat.webnav.result.ResultWrapper;
import com.igreat.webnav.repository.*;
import com.igreat.webnav.service.IndexService;
import com.igreat.webnav.utils.ResultUtils;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <pre>
 *     author : 陈伟
 *     e-mail : chenwei@njbandou.com
 *     time   : 2019/08/28
 *     desc   : say something
 *     version: 1.0
 * </pre>
 */
@Service
public class IndexServiceImpl implements IndexService {

    @Resource
    BannerDAO bannerDAO;
    @Resource
    NavigationCateDAO navigationCateDAO;
    @Resource
    NavigationCommonDAO navigationCommonDAO;
    @Resource
    NavigationFloatDAO navigationFloatDAO;
    @Resource
    NavigationUrlsDAO navigationUrlsDAO;
    @Resource
    SearchNavUrlsDao searchNavUrlsDao;


    @Override
    public ResultWrapper getIndexInfo() {
        Map<String, Object> dataMap = new HashMap<>();
        Sort orderValue = new Sort(Sort.Direction.DESC, "orderValue");
        //添加轮播图
        List<SiteBanner> bannerAll = bannerDAO.findAll(orderValue);
        List<Map> bannerList = new ArrayList<>();
        for (SiteBanner siteBanner : bannerAll) {
            Map<String, Object> hashMap = new HashMap<>();
            hashMap.put("title", siteBanner.getTitle());
            hashMap.put("image", siteBanner.getImage());
            bannerList.add(hashMap);
        }
        dataMap.put("banners", bannerList);
        //添加常用导航地址
        List<NavigationCommon> commonUrlsAll = navigationCommonDAO.findAll(orderValue);
        List<Map> commonList = new ArrayList<>();
        for (NavigationCommon navigationCommon : commonUrlsAll) {
            Map<String, Object> hashMap = new HashMap<>();
            hashMap.put("icon", navigationCommon.getIcon());
            hashMap.put("name", navigationCommon.getName());
            hashMap.put("url", navigationCommon.getUrl());
            commonList.add(hashMap);
        }
        dataMap.put("commons", commonList);
        //添加搜索平台
        List<SearchNavUrls> searchNavUrls = searchNavUrlsDao.findAll(orderValue);
        List<Map> searchUrlsList = new ArrayList<>();
        for (SearchNavUrls searchNavUrl : searchNavUrls) {
            if (searchNavUrl.getLeaderId() == 0) {
                Map<String, Object> hashMap = new HashMap<>();
                hashMap.put("icon", searchNavUrl.getIcon());
                hashMap.put("name", searchNavUrl.getName());
                hashMap.put("url", searchNavUrl.getUrl());
                List<Map> hideList = new ArrayList<>();
                for (SearchNavUrls navUrl : searchNavUrls) {
                    if (navUrl.getLeaderId() == searchNavUrl.getPkId()) {
                        Map<String, Object> navMap = new HashMap<>();
                        navMap.put("icon", navUrl.getIcon());
                        navMap.put("name", navUrl.getName());
                        navMap.put("url", navUrl.getUrl());
                        hideList.add(navMap);
                    }
                }
                hashMap.put("hideList", hideList);
                searchUrlsList.add(hashMap);
            }
        }
        dataMap.put("searchs", searchUrlsList);
        //添加分类
        NavigationCate navigationCate = new NavigationCate();
        navigationCate.setParentId(0);
        Example<NavigationCate> example = Example.of(navigationCate);
        List<NavigationCate> cates = navigationCateDAO.findAll(example, orderValue);
        List<Map> cateList = new ArrayList<>();
        for (NavigationCate cate : cates) {
            Map<String, Object> hashMap = new HashMap<>();
            hashMap.put("icon", cate.getIcon());
            hashMap.put("id", cate.getPkId());
            hashMap.put("name", cate.getName());
            cateList.add(hashMap);
        }
        dataMap.put("cates", cateList);
        //添加悬浮导航
        List<NavigationFloat> floats = navigationFloatDAO.findAll(orderValue);
        List<Map> floatList = new ArrayList<>();
        for (NavigationFloat floatUrl : floats) {
            Map<String, Object> hashMap = new HashMap<>();
            hashMap.put("name", floatUrl.getName());
            hashMap.put("url", floatUrl.getUrl());
            hashMap.put("textColor", floatUrl.getTextColor());
            hashMap.put("level", floatUrl.getLevel());
            floatList.add(hashMap);
        }
        dataMap.put("floats", floatList);
        return ResultUtils.success(dataMap);
    }

    @Override
    public ResultWrapper getNavigationUrlByCate(Integer cateId) {
        Map<String, Object> dataMap = new HashMap<>();
        Sort orderValue = new Sort(Sort.Direction.DESC, "orderValue");
        List<Integer> cateIds = new ArrayList<>();
        //查询分类
        NavigationCate navigationCate = new NavigationCate();
        navigationCate.setParentId(cateId);
        Example<NavigationCate> example = Example.of(navigationCate);
        List<NavigationCate> cates = navigationCateDAO.findAll(example, orderValue);
        //循环获取二级分类
        for (NavigationCate cate : cates) {
            cateIds.add(cate.getPkId());
        }
        //查询导航地址
        List<NavigationUrls> urls = cateIds.size() > 0 ? navigationUrlsDAO.findUrlsByCates(cateIds) : new ArrayList<>();

        //组装返回数据
        List<Map> cateList = new ArrayList<>();
        for (NavigationCate cate : cates) {
            Map<String, Object> hashMap = new HashMap<>();
            hashMap.put("icon", cate.getIcon());
            hashMap.put("intro", cate.getIntro());
            hashMap.put("themeColor", cate.getThemeColor());
            hashMap.put("name", cate.getName());
            List<Map> urlsList = new ArrayList<>();
            for (NavigationUrls url : urls) {
                if (url.getCateId() == cate.getPkId()) {
                    Map<String, Object> urlMap = new HashMap<>();
                    urlMap.put("icon", url.getIcon());
                    urlMap.put("shortName", url.getShortName());
                    urlMap.put("longName", url.getLongName());
                    urlMap.put("url", url.getUrl());
                    urlsList.add(urlMap);
                }
            }
            hashMap.put("urls", urlsList);
            cateList.add(hashMap);
        }
        dataMap.put("cates", cateList);
        return ResultUtils.success(dataMap);
    }
}
