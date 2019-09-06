import { Injectable} from '@angular/core';
import { HttpClient, HttpParams,HttpHeaders} from '@angular/common/http';
import {Banner} from './banner';
import {Constants} from '../../constants';

@Injectable({
  providedIn: 'root'
})
export class BannerHttpServiceService{
  
  ngOnInit(): void {
     
  }

  constructor(
    private http: HttpClient
  ) { }

  /**
   * 请求列表
   * @param keyword 关键词
   * @param pageIndex 页面索引，从1开始
   * @param pageSize 每页显示的数量
   */
  list(keyword:string,pageIndex: number,pageSize: number){
    const params = new HttpParams()
    .set('keywords', keyword)
    .set('pageIndex', pageIndex+'')
    .set('pageSize',pageSize+'');
    return this.http.get(Constants.HTTP_SERVER + "banner/list",{params});
  }

  /**
   * 添加和修改轮播图
   * @param banner
   */
  addOrUpdate(banner: Banner){
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' })
    };
    const params = {
      "pkId": banner.pkId,
      "title": banner.title,
      "image": banner.image,
      "orderValue": banner.orderValue?banner.orderValue:0
    }
    return this.http.post(Constants.HTTP_SERVER + "banner/addOrUpdate",params,httpOptions);
  }

  /**
   * 批量删除
   * @param ids 需要删除的id集合
   */
  batDelete(ids: number[]){
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' })
    };
    const params = ids;
    return this.http.post(Constants.HTTP_SERVER + "banner/delete",params,httpOptions);
  }

  /**
   * 单个删除
   * @param id 单个对象的id
   */
  delete(id: number){
    return this.batDelete([id]);
  }
}
