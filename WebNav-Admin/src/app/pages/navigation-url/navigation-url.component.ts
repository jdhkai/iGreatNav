import { Component, OnInit } from '@angular/core';
import { NavigationUrlHttpServiceService } from './navigation-url-http-service.service';
import { NzMessageService } from 'ng-zorro-antd';
import { UploadFile } from 'ng-zorro-antd/upload';
import { Observable, Observer } from 'rxjs';
import {Constants} from '../../constants';
import {NavigationUrl} from './navigation-url';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-navigation-url',
  templateUrl: './navigation-url.component.html',
  styleUrls: ['./navigation-url.component.less']
})
export class NavigationUrlComponent implements OnInit {

  keyword: string = "";  //搜索的关键词
  pageIndex: number = 1; //当前页的索引
  pageSize: number = 10;  //每页显示的条数
  cateId: number = -1;
  totalCount: number = 0;  //列表总数
  tableData: any[] = [];  //表格数据
  isLoading: boolean = true; //表格是否正在加载中
  mapOfCheckedId: { [key: string]: boolean } = {}; //表格数据选中

  /**
   *  新增和编辑模拟框
   */
  showEditModel:boolean = false;
  isOkLoading: boolean = false;
  nav: NavigationUrl = new NavigationUrl();

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
  catesOptions: any[] = null;
  catesOrigin: any[] = null;
  isGetLeaders:boolean = false; //是否加载成功
  leadersLoading:boolean = false;//是否存在加载
  values: any[] | null = null;

  constructor(
    private apiService: NavigationUrlHttpServiceService,
    private message: NzMessageService,
    private fb: FormBuilder
  ) { }

  ngOnInit() {
    this.validateForm = this.fb.group({
      shortName: [null, [Validators.required]],
      longName: [null, [Validators.required]],
      icon: [null, [Validators.required]],
      values: [[], [Validators.required]],
      url: [null, [Validators.required,Validators.pattern("(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;{}]+[-A-Za-z0-9+&@#/%=~_|]")]],
      orderValue: [0,[Validators.required]]
    });
    this.requestList();
    this.getAllCates(true);
  }

  /**
   * 请求列表
   */
  requestList() {
    this.isLoading = true;
    this.apiService.list(this.keyword, this.pageIndex-1, this.pageSize,this.cateId).subscribe((res:any) => {
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
   * 获取所有分类
   * @param activeLoad 是否主动加载
   */
  getAllCates(activeLoad:boolean){
    this.leadersLoading = true;
    this.apiService.allCate().subscribe((res:any) => {
      if(res.code === 0){
        const data = res.data;
        this.catesOrigin = data.list;
        var cateOptions = [];
        data.list.forEach(element => {
          if(element.parentId===0){
            var childs = [];
            data.list.forEach(child => {
              if(child.parentId===element.pkId){
                childs.push({
                  value: child.pkId,
                  label: child.name,
                  isLeaf: true
                });
              }
            });
            cateOptions.push({
              value: element.pkId,
              label: element.name,
              children: childs,
              isLeaf: childs.length<=0,
              disabled: childs.length<=0
            })
          }
        });
        this.catesOptions = cateOptions;
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
      this.nav.shortName = item.shortName;
      this.nav.longName = item.longName;
      this.nav.icon = item.icon;
      this.nav.url = item.url;
      this.nav.cateId = item.cateId;
      this.nav.orderValue = item.orderValue;
      this.nav.values = null;
      if(this.isGetLeaders){
        this.catesOrigin.forEach(element=>{
          console.log(element.pkId,"---",item.cateId);
          if(element.pkId===item.cateId){
            this.nav.values = [element.parentId,item.cateId]
            return;
          }
        })
      }
      console.log(this.nav.values);
    }
    else{
      this.nav.pkId = null;
      this.nav.shortName = null;
      this.nav.longName = null;
      this.nav.icon = null;
      this.nav.url = null;
      this.nav.cateId = (this.cateId>-1?this.cateId:0);
      this.nav.orderValue = 0;
      this.nav.values = null;
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
    this.nav.cateId = this.nav.values[this.nav.values.length-1];
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

  onChanges(values: any): void {
    console.log(values, this.values);
    if(this.values.length>0){
      this.cateId = this.values[this.values.length-1];
    }
    else{
      this.cateId = -1;
    }
    this.requestList();
  }
}

