import { Component, OnInit } from '@angular/core';
import { NavCateHttpServiceService } from './navigation-cate-http-service.service';
import { NzMessageService } from 'ng-zorro-antd';
import { UploadFile } from 'ng-zorro-antd/upload';
import { Observable, Observer } from 'rxjs';
import {Constants} from '../../constants';
import {NavCate} from './navigation-cate';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-navigation-cate',
  templateUrl: './navigation-cate.component.html',
  styleUrls: ['./navigation-cate.component.less']
})
export class NavigationCateComponent implements OnInit {

  keyword: string = "";  //搜索的关键词
  listOfMapData;
  isLoading: boolean = true; //表格是否正在加载中
  mapOfCheckedId: { [key: string]: boolean } = {}; //表格数据选中
  mapOfExpandedData: { [key: string]: any[] } = {};
  level1Cate: any[];//一级分类

  /**
   *  新增和编辑模拟框
   */
  showEditModel:boolean = false;
  isOkLoading: boolean = false;
  nav: NavCate = new NavCate();

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
  values: any[] | null = null;

  constructor(
    private apiService: NavCateHttpServiceService,
    private message: NzMessageService,
    private fb: FormBuilder
  ) { }

  introValidator = (control: FormControl): { [s: string]: boolean } => {
    if(this.nav.parentId!=0 && !control.value){
      return { required: true };
    }
    return {};
  };
  iconValidator = (control: FormControl): { [s: string]: boolean } => {
    if(this.nav.parentId===0 && !control.value){
      return { required: true };
    }
    return {};
  };
  themeColorValidator = (control: FormControl): { [s: string]: boolean } => {
    if(this.nav.parentId!=0 && !control.value){
      return { required: true };
    }
    return {};
  };

  ngOnInit() {
    this.validateForm = this.fb.group({
      name: [null, [Validators.required]],
      intro: [null, [this.introValidator]],
      icon: [null, [this.iconValidator]],
      themeColor: [null, [this.themeColorValidator,Validators.pattern("^#[a-fA-F1-90]{6}")]],
      // level: [null, [Validators.required]],
      parentId: [null, [Validators.required]],
      orderValue: [0,[Validators.required]]
    });
    this.requestList();
  }

  /**
   * 获取一级分类
   */
  requestLevel1Cate(){
    this.apiService.list("",0).subscribe((res:any) => {
      if(res.code===0){
        const data = res.data;
        this.level1Cate = data.list;
      }
    });
  }

  /**
   * 请求列表
   */
  requestList() {
    this.requestLevel1Cate();
    this.isLoading = true;
    this.apiService.list(this.keyword).subscribe((res:any) => {
      if(res.code === 0){
        const data = res.data;
        console.log(data);
        var cateOptions = [];
        data.list.forEach(element => {
          if(element.parentId===0){
            var childs = [];
            data.list.forEach(child => {
              if(child.parentId===element.pkId){
                childs.push({
                  pkId: child.pkId,
                  icon: child.icon,
                  name: child.name,
                  intro: child.intro,
                  themeColor: child.themeColor,
                  parentId: child.parentId,
                  orderValue: child.orderValue,
                  level: child.level,
                });
              }
            });
            cateOptions.push({
              pkId: element.pkId,
              icon: element.icon,
              name: element.name,
              intro: element.intro,
              themeColor: element.themeColor,
              parentId: element.parentId,
              level: element.level,
              orderValue: element.orderValue,
              children: childs
            })
          }
        });
        if(cateOptions.length===0 && data.list.length!=0){
          data.list.forEach(element=>{
            cateOptions.push({
              pkId: element.pkId,
              icon: element.icon,
              name: element.name,
              intro: element.intro,
              themeColor: element.themeColor,
              parentId: element.parentId,
              orderValue: element.orderValue,
              level: element.level,
              children: []
            })
          });
        }
        this.listOfMapData = cateOptions;
        this.listOfMapData.forEach(item => {
          this.mapOfExpandedData[item.pkId] = this.convertTreeToList(item);
        });
        console.log(this.mapOfExpandedData);
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
      this.nav.themeColor = item.themeColor;
      this.nav.intro = item.intro;
      this.nav.parentId = item.parentId;
      this.nav.orderValue = item.orderValue;
      this.nav.level = item.level;
    }
    else{
      this.nav.pkId = null;
      this.nav.name = null;
      this.nav.icon = "";
      this.nav.themeColor = "";
      this.nav.intro = "";
      this.nav.parentId = 0;
      this.nav.orderValue = 0;
      this.nav.level = 0;
    }
    this.showEditModel = true;
  }

  /**
   * 搜索
   */
  search(){
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
    this.nav.level = (this.nav.parentId===0?1:2);
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

  //-----------树表格--------------

  convertTreeToList(root: object): any[] {
    const stack: any[] = [];
    const array: any[] = [];
    const hashMap = {};
    stack.push({ ...root, treeLevel: 0, expand: false });

    while (stack.length !== 0) {
      const node = stack.pop();
      this.visitNode(node, hashMap, array);
      if (node.children) {
        for (let i = node.children.length - 1; i >= 0; i--) {
          stack.push({ ...node.children[i], treeLevel: node.treeLevel + 1, expand: false, parent: node });
        }
      }
    }

    return array;
  }

  visitNode(node: any, hashMap: { [key: string]: any }, array: any[]): void {
    if (!hashMap[node.pkId]) {
      hashMap[node.pkId] = true;
      array.push(node);
    }
  }

  collapse(array: any[], data: any, $event: boolean): void {
    if ($event === false) {
      if (data.children) {
        data.children.forEach(d => {
          const target = array.find(a => a.pkId === d.pkId)!;
          target.expand = false;
          this.collapse(array, target, false);
        });
      } else {
        return;
      }
    }
  }
}


