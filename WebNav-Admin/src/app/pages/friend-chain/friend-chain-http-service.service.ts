import { Injectable} from '@angular/core';
import { HttpClient, HttpParams,HttpHeaders} from '@angular/common/http';
import {FriendChain} from './friend-chain';
import {Constants} from '../../constants';

@Injectable({
  providedIn: 'root'
})
export class FriendChainHttpServiceService{
  
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
  list(keyword:string,pageIndex: number,pageSize: number,level:number){
    const params = new HttpParams()
    .set('keywords', keyword)
    .set('pageIndex', pageIndex+'')
    .set('pageSize',pageSize+'')
    .set('level',level+'');
    return this.http.get(Constants.HTTP_SERVER + "navigation-float/list",{params});
  }

  /**
   * 添加和修改
   * @param friendChain
   */
  addOrUpdate(friendChain: FriendChain){
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' })
    };
    const params = {
      "pkId": friendChain.pkId,
      "name": friendChain.name,
      "url": friendChain.url,
      "level": friendChain.level,
      "textColor": friendChain.textColor,
      "orderValue": friendChain.orderValue?friendChain.orderValue:0
    }
    return this.http.post(Constants.HTTP_SERVER + "navigation-float/addOrUpdate",params,httpOptions);
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
    return this.http.post(Constants.HTTP_SERVER + "navigation-float/delete",params,httpOptions);
  }

  /**
   * 单个删除
   * @param id 单个对象的id
   */
  delete(id: number){
    return this.batDelete([id]);
  }
}
