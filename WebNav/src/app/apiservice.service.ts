import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class APIServiceService {

  // baseUrl = "http://47.96.98.193:80/WebNav"

  constructor(
    private http: HttpClient
  ) { }

  getIndex(){
    return this.http.get("http://47.96.98.193:8888/web-api/index/list")
  }

  getUrls(id: number){
    var params = new FormData();
    params.set("cateId",id.toString());
    return this.http.post("http://47.96.98.193:8888/web-api/urls/listByCate",params);
  }
}
