import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BannerRoutingModule } from './banner-routing.module';
import { BannerComponent } from './banner.component'
import { NgZorroAntdModule, NZ_I18N, zh_CN } from 'ng-zorro-antd';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [BannerComponent],
  imports: [
    CommonModule,
    BannerRoutingModule,
    NgZorroAntdModule,
    FormsModule,
    ReactiveFormsModule
  ],
  exports: [BannerComponent]
})
export class BannerModule { }
