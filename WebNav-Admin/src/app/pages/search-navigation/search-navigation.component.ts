import { Component, OnInit } from '@angular/core';
import { SearchNavHttpServiceService } from './search-nav-http-service.service';
import { NzMessageService } from 'ng-zorro-antd';
import { UploadFile } from 'ng-zorro-antd/upload';
import { Observable, Observer } from 'rxjs';
import {Constants} from '../../constants';
import {SearchNav} from './search-navigation';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-search-navigation',
  templateUrl: './search-navigation.component.html',
  styleUrls: ['./search-navigation.component.less']
})
export class SearchNavigationComponent implements OnInit {

  keyword: string = "";  //搜索的关键词
  pageIndex: number = 1; //当前页的索引
  pageSize: number = 5;  //每页显示的条数
  leaderId: number = -1;
  totalCount: number = 0;  //列表总数
  tableData: any[] = [];  //表格数据
  isLoading: boolean = true; //表格是否正在加载中
  mapOfCheckedId: { [key: string]: boolean } = {}; //表格数据选中

  /**
   *  新增和编辑模拟框
   */
  showEditModel:boolean = false;
  isOkLoading: boolean = false;
  nav: SearchNav = new SearchNav();

  /**
   * 上传图片
   */
  uploadUrl = Constants.IMAGE_UPLOAD_URL;
  private uploadImg: string = "";
  loading = false;

  /**
   * 表单验证
   * @param apiService 
   * @param message 
   */
  validateForm: FormGroup;
  
  /**
   * 可选的领导
   */
  leaders: any[] = [];
  isGetLeaders:boolean = false; //是否加载成功
  leadersLoading:boolean = false;//是否存在加载

  constructor(
    private apiService: SearchNavHttpServiceService,
    private message: NzMessageService,
    private fb: FormBuilder
  ) { }

  ngOnInit() {
    this.validateForm = this.fb.group({
      name: [null, [Validators.required]],
      icon: [null, [Validators.required]],
      url: [null, [Validators.required,Validators.pattern("(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;{}]+[-A-Za-z0-9+&@#/%=~_|{}]")]],
      orderValue: [0,[Validators.required]]
    });
    this.requestList();
    this.getAllLeader(true);
  }

  /**
   * 请求列表
   */
  requestList() {
    this.isLoading = true;
    this.apiService.list(this.keyword, this.pageIndex-1, this.pageSize,this.leaderId).subscribe((res:any) => {
      if(res.code === 0){
        const data = res.data;
        console.log(data);
        //若删除或刷新时页面列表数据为0且当前页面搜索大于1时，请求刷新上一页
        if(data.list.length==0 && data.totalCount!=0&&this.pageIndex>1)
        {
          this.pageIndex=1;
          this.requestList();
          return;
        }
        this.tableData = data.list;
        this.totalCount = data.totalCount;
        console.log(this.totalCount);
        this.mapOfCheckedId = {};
      }
      else{
        this.message.error(res.msg);
      }
    }, (err) => {
      this.isLoading = false;
      this.message.create('error', `请求失败` + err);
      console.log(err);
    }, ()=> {
      this.isLoading = false;
    });
  }

  /**
   * 获取所有领导
   * @param activeLoad 是否主动加载
   */
  getAllLeader(activeLoad:boolean){
    this.leadersLoading = true;
    this.apiService.list("", 0, 10000,0).subscribe((res:any) => {
      if(res.code === 0){
        const data = res.data;
        console.log(data);
        this.leaders = data.list;
        this.isGetLeaders = true;
      }
      else{
        if(!activeLoad){
          this.message.error(res.msg);
        }
      }
    }, (err) => {
      this.leadersLoading = false;
      if(!activeLoad){
        this.message.create('error', `请求失败` + err);
      }
      console.log(err);
    }, ()=> {
      this.leadersLoading = false;
    });
  }

  /**
   * 点击刷新按钮
   */
  refresh(){
    this.requestList();
  }

  /**
   * 批量删除
   */
  batchDelete(){
    var ids:number[] = [];
    console.log(this.mapOfCheckedId);
    
    for(var id in this.mapOfCheckedId){
      if(this.mapOfCheckedId[id])
      {
        ids.push(Number.parseInt(id));
      }
    }
    this.requestDelete(ids);
  }

  /**
   * 请求删除接口
   * @param ids 
   */
  requestDelete(ids:number[]){
    console.log(ids);
    this.apiService.batDelete(ids).subscribe((res:any) => {
      if(res.code === 0){
        const data = res.data;
        this.message.success('删除成功');
        this.requestList();
      }
      else{
        this.message.error(res.msg);
      }
    }, (err) => {
      this.message.error("删除失败："+err);
      console.log(err);
    }, ()=> {
    });
  }

  /**
   * 删除指定项
   * @param pkId 
   */
  delete(pkId:number){
    this.requestDelete([pkId]);
  }

  /**
   * 关闭编辑
   */
  closeEdit(e: MouseEvent){
    if(e){
      e.preventDefault();
    }
    this.showEditModel = false;
    this.validateForm.reset();
    for (const key in this.validateForm.controls) {
      this.validateForm.controls[key].markAsPristine();
      this.validateForm.controls[key].updateValueAndValidity();
    }
  }

  /**
   * 编辑
   */
  edit(item){
    if(item){
      this.nav.pkId = item.pkId;
      this.nav.name = item.name;
      this.nav.icon = item.icon;
      this.nav.url = item.url;
      this.nav.leaderId = item.leaderId;
      this.nav.orderValue = item.orderValue;
    }
    else{
      this.nav.pkId = null;
      this.nav.name = null;
      this.nav.icon = null;
      this.nav.url = null;
      this.nav.leaderId = (this.leaderId>-1?this.leaderId:0);
      this.nav.orderValue = 0;
    }
    this.showEditModel = true;
  }

  /**
   * 搜索
   */
  search(){
    this.pageIndex = 1;
    this.requestList();
  }

  /**
   * 保存编辑
   */
  saveEdit(){
    for (const i in this.validateForm.controls) {
      this.validateForm.controls[i].markAsDirty();
      this.validateForm.controls[i].updateValueAndValidity();
    }
    if(!this.validateForm.valid){
      return;
    }
    this.isOkLoading = true;
    this.apiService.addOrUpdate(this.nav).subscribe((res:any) => {
      if(res.code === 0){
        const data = res.data;
        this.message.success((this.nav.pkId?'编辑成功':"新增成功"));
        this.closeEdit(null);
        this.requestList();
      }
      else{
        this.message.error(res.msg);
      }
    }, (err) => {
      this.isOkLoading = false;
      this.message.create('error', (this.nav.pkId?'编辑失败':"新增失败") + err);
      console.log(err);
    }, ()=> {
      this.isOkLoading = false;
    });
  }

  /**
   * 上传图片
   */
  beforeUpload = (file: File) => {
    return new Observable((observer: Observer<boolean>) => {
      const isLt300k = file.size / 1024 < 300;
      if (!isLt300k) {
        this.message.error('上传的图片必须小于300kb!');
        observer.complete();
        return;
      }
      observer.next(isLt300k);
      observer.complete();
    });
  };

  handleChange(info: { file: UploadFile }): void {
    switch (info.file.status) {
      case 'uploading':
        this.loading = true;
        break;
      case 'done':
        this.loading = false;
        var result = info.file.response;
        this.nav.icon = Constants.IMAGE_SERVER_LOCATION + result.data.path;
        break;
      case 'error':
        this.message.error('Network error');
        this.loading = false;
        break;
    }
  }

  optionsChange(){
    this.requestList();
  }
}

