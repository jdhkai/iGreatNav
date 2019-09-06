import { Component, OnInit } from '@angular/core';
import { APIServiceService } from './apiservice.service';
import { NzMessageService } from 'ng-zorro-antd/message';
import{ DomSanitizer }from'@angular/platform-browser';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.less']
})
export class AppComponent implements OnInit{
  
  title = 'WebNav';
  searchPlatforms = [
    {
      "name":"Baidu",
      "url": "https://www.baidu.com/s?wd="
    },
    {
      "name":"Google",
      "url": "https://www.google.com/search?q="
    },
    {
      "name":"Sogou",
      "url": "https://www.sogou.com/web?query="
    },
    {
      "name":"Bing",
      "url": "https://www.bing.com/search?q="
    },
    {
      "name":"微博搜索",
      "url": "https://s.weibo.com/weibo?q="
    },
    {
      "name":"微信平台",
      "url": "https://weixin.sogou.com/weixin?type=2&s_from=input&query="
    },
    {
      "name":"电影资源",
      "url": "https://www.cilimao.cc/search?word="
    },
    {
      "name":"影视狂搜",
      "url": "http://www.ifkdy.com/?q="
    },
    {
      "name":"豆瓣电影",
      "url": "https://movie.douban.com/subject_search?search_text="
    }
  ]

  //Banner信息
  banners = []; //所有轮播图列表
  curBanners;  //当前显示的轮播图
  bannerIndex: number = 0;  //当前显示的Banner信息索引值
  isLockBanner = false;

  showSearch: boolean = true; //是否显示搜索框

  commonSite = [];  //常用网址导航

  topCate = []; //顶级分类
  selectTopCate; //当前选中的分类

  floatUrls = []; //悬浮快捷链接

  childCateUrls = [];// 二级分类及网站地址

  searchSiteUrls = []; //搜索框下方的搜索链接 

  inputKey = ""; //输入的搜索关键词
  searchPlatform = this.searchPlatforms[0]; //选择的搜索平台,默认为百度


  constructor(
    private apiService:APIServiceService,
    private message: NzMessageService,
    private sanitizer: DomSanitizer
  ){

  }

  ngOnInit(): void {
    this.apiService.getIndex().subscribe((res:any)=>{
      // this.message.create('success', `请求成功`);
      var data = res.data;
      this.banners = data.banners;
      if(this.banners.length > 0)
      {
        this.bannerIndex = 0;
        this.curBanners = this.sanitizer.bypassSecurityTrustStyle("url("+this.banners[this.bannerIndex].image+")");
      }
      else{
        this.bannerIndex = -1;
        this.curBanners = null;
      }

      this.commonSite = data.commons;
      this.topCate = data.cates;
      if(this.topCate.length>0){
        this.selectTopCate = this.topCate[0];
        // this.switchCate(this.selectTopCate);
        this.requestChildCate(this.selectTopCate.id);
      }

      this.floatUrls = data.floats;
      this.searchSiteUrls = data.searchs;
      // console.log(this.topCate);
    },(err)=>{
      this.message.create('error', `请求失败` + err);
      console.log(err);
    },()=>{
      // this.message.create('success', `请求完成`);
    });
  }

  prevBanner(){
    if(this.bannerIndex===-1 || this.isLockBanner)
    {
      return;
    }
    this.bannerIndex -= 1;
    if(this.bannerIndex < 0){
      this.bannerIndex = this.banners.length -1;
    }
    this.curBanners = this.sanitizer.bypassSecurityTrustStyle("url("+this.banners[this.bannerIndex]['image']+")");
  }

  nextBanner(){
    if(this.bannerIndex===-1 || this.isLockBanner)
    {
      return;
    }
    this.bannerIndex += 1;
    if(this.bannerIndex > this.banners.length-1){
      this.bannerIndex = 0;
    }
    this.curBanners = this.sanitizer.bypassSecurityTrustStyle("url("+this.banners[this.bannerIndex]['image']+")");
  }

  switchCate(item:any){
    if(item.id != this.selectTopCate)
    {
      this.requestChildCate(item.id);
    }
    this.selectTopCate = item;
  }

  //请求获取二级分类及导航网站的接口
  requestChildCate(id){
    //请求接口
    this.apiService.getUrls(id).subscribe((res:any)=>{
      // this.message.create('success', `请求成功`);
      var data = res.data;
      this.childCateUrls = data.cates;
    },(err)=>{
      this.message.create('error', `请求失败` + err);
      console.log(err);
    },()=>{
      // this.message.create('success', `请求完成`);
    });
  }

  //滚动到顶部
  scrollToTop(){
    window.scroll(0,0);
  }

  search(url:string){
    let fullUrl = url.replace(/\{queryKey\}/g,this.inputKey);
    window.open(fullUrl);
  }

  onEnter(key:string)
  {
    // this.message.create("info",key);
    window.open(this.searchPlatform.url + key);
  }

  selectPlatform(item){
    this.searchPlatform = item;
  }
}
