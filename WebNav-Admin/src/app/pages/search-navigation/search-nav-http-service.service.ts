import { Injectable} from '@angular/core';
import { HttpClient, HttpParams,HttpHeaders} from '@angular/common/http';
import {SearchNav} from './search-navigation';
import {Constants} from '../../constants';

@Injectable({
  providedIn: 'root'
})
export class SearchNavHttpServiceService{
  
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
  list(keyword:string,pageIndex: number,pageSize: number,leaderId:number){
    const params = new HttpParams()
    .set('keywords', keyword)
    .set('pageIndex', pageIndex+'')
    .set('pageSize',pageSize+'')
    .set('leaderId',leaderId+'');
    return this.http.get(Constants.HTTP_SERVER + "search-nav/list",{params});
  }

  /**
   * 添加和修改
   * @param nav
   */
  addOrUpdate(nav: SearchNav){
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' })
    };
    const params = {
      "pkId": nav.pkId,
      "name": nav.name,
      "url": nav.url,
      "icon": nav.icon,
      "leaderId": nav.leaderId,
      "orderValue": nav.orderValue?nav.orderValue:0
    }
    return this.http.post(Constants.HTTP_SERVER + "search-nav/addOrUpdate",params,httpOptions);
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
    return this.http.post(Constants.HTTP_SERVER + "search-nav/delete",params,httpOptions);
  }

  /**
   * 单个删除
   * @param id 单个对象的id
   */
  delete(id: number){
    return this.batDelete([id]);
  }
}
