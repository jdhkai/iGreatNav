import { Component, OnInit } from '@angular/core';
import { FriendChainHttpServiceService } from './friend-chain-http-service.service';
import { NzMessageService } from 'ng-zorro-antd';
import { Observable, Observer } from 'rxjs';
import {FriendChain} from './friend-chain';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-friend-chain',
  templateUrl: './friend-chain.component.html',
  styleUrls: ['./friend-chain.component.less']
})
export class FriendChainComponent implements OnInit {

  keyword: string = "";  //搜索的关键词
  level:string = "0";
  pageIndex: number = 1; //当前页的索引
  pageSize: number = 5;  //每页显示的条数
  totalCount: number = 0;  //列表总数
  tableData: any[] = [];  //表格数据
  isLoading: boolean = true; //表格是否正在加载中
  mapOfCheckedId: { [key: string]: boolean } = {}; //表格数据选中

  /**
   *  新增和编辑模拟框
   */
  showEditModel:boolean = false;
  isOkLoading: boolean = false;
  friendChain: FriendChain = new FriendChain();

  /**
   * 表单验证
   * @param apiService 
   * @param message 
   */
  validateForm: FormGroup;

  constructor(
    private apiService: FriendChainHttpServiceService,
    private message: NzMessageService,
    private fb: FormBuilder
  ) { }

  ngOnInit() {
    this.validateForm = this.fb.group({
      name: [null, [Validators.required]],
      url: [null, [Validators.required,Validators.pattern("(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]")]],
      textColor: ["#FFFFFF", [Validators.required,Validators.pattern("^#[a-fA-F1-90]{6}")]],
      orderValue: [0,[Validators.required]]
    });
    this.requestList();
  }

  /**
   * 请求列表
   */
  requestList() {
    this.isLoading = true;
    this.apiService.list(this.keyword, this.pageIndex-1, this.pageSize,parseInt(this.level)).subscribe((res:any) => {
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
   * 点击刷新按钮
   */
  refresh(){
    this.requestList();
  }

  /**
   * 选择状态改变
   */
  optionsChange(){
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
      this.friendChain.pkId = item.pkId;
      this.friendChain.name = item.name;
      this.friendChain.url = item.url;
      this.friendChain.level = item.level + "";
      this.friendChain.textColor = item.textColor;
      this.friendChain.orderValue = item.orderValue;
    }
    else{
      this.friendChain.pkId = null;
      this.friendChain.name = null;
      this.friendChain.url = null;
      this.friendChain.level = "1";
      this.friendChain.textColor = null;
      this.friendChain.orderValue = 0;
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
    this.apiService.addOrUpdate(this.friendChain).subscribe((res:any) => {
      if(res.code === 0){
        const data = res.data;
        this.message.success((this.friendChain.pkId?'编辑成功':"新增成功"));
        this.closeEdit(null);
        this.requestList();
      }
      else{
        this.message.error(res.msg);
      }
    }, (err) => {
      this.isOkLoading = false;
      this.message.create('error', (this.friendChain.pkId?'编辑失败':"新增失败") + err);
      console.log(err);
    }, ()=> {
      this.isOkLoading = false;
    });
  }
}

