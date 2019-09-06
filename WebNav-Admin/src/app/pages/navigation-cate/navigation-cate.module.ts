import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { NavigationCateRoutingModule } from './navigation-cate-routing.module';

import { NavigationCateComponent } from './navigation-cate.component';
import { NgZorroAntdModule, NZ_I18N, zh_CN } from 'ng-zorro-antd';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { ColorPickerModule } from 'ngx-color-picker';


@NgModule({
  declarations: [NavigationCateComponent],
  imports: [
    CommonModule,
    NavigationCateRoutingModule,
    NgZorroAntdModule,
    FormsModule,
    ReactiveFormsModule,
    ColorPickerModule
  ],
  exports: [NavigationCateComponent]
})
export class NavigationCateModule { }
