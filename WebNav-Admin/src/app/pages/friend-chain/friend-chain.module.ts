import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FriendChainRoutingModule } from './friend-chain-routing.module';

import { FriendChainComponent } from './friend-chain.component';

import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { NgZorroAntdModule, NZ_I18N, zh_CN } from 'ng-zorro-antd';
import { ColorPickerModule } from 'ngx-color-picker';

@NgModule({
  declarations: [FriendChainComponent],
  imports: [
    CommonModule,
    FriendChainRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    NgZorroAntdModule,
    ColorPickerModule
  ],
  exports: [FriendChainComponent]
})
export class FriendChainModule { }
