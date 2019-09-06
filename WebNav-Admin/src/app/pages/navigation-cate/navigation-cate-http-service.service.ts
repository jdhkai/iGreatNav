import { Injectable} from '@angular/core';
import { HttpClient, HttpParams,HttpHeaders} from '@angular/common/http';
import {NavCate} from './navigation-cate';
import {Constants} from '../../constants';

@Injectable({
  providedIn: 'root'
})
export class NavCateHttpServiceService{
  
  ngOnInit(): void {
     
  }

  constructor(
    private http: HttpClient
  ) { }

  /**
   * 请求列表
   */
  list(keyword:string,parentId:number = -1){
    const params = new HttpParams()
    .set('keywords',keyword)
    .set('parentId',parentId+"");
    return this.http.get(Constants.HTTP_SERVER + "navigation-cate/list",{params});
  }

  /**
   * 添加和修改
   * @param nav
   */
  addOrUpdate(nav: NavCate){
    const httpOptions = {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' })
    };
    const params = {
      "pkId": nav.pkId,
      "name": nav.name,
      "icon": nav.icon,
      "themeColor": nav.themeColor,
      "intro": nav.intro,
      "parentId": nav.parentId,
      "level": nav.level,
      "orderValue": nav.orderValue?nav.orderValue:0
    }
    return this.http.post(Constants.HTTP_SERVER + "navigation-cate/addOrUpdate",params,httpOptions);
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
    return this.http.post(Constants.HTTP_SERVER + "navigation-cate/delete",params,httpOptions);
  }

  /**
   * 单个删除
   * @param id 单个对象的id
   */
  delete(id: number){
    return this.batDelete([id]);
  }
}
