import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { NavigationUrlRoutingModule } from './navigation-url-routing.module';
import { NavigationUrlComponent } from './navigation-url.component';
import { NgZorroAntdModule, NZ_I18N, zh_CN } from 'ng-zorro-antd';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [NavigationUrlComponent],
  imports: [
    CommonModule,
    NavigationUrlRoutingModule,
    NgZorroAntdModule,
    FormsModule,
    ReactiveFormsModule
  ],
  exports: [NavigationUrlComponent]
})
export class NavigationUrlModule { }
