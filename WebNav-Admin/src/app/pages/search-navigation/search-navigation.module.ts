import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SearchNavigationRoutingModule } from './search-navigation-routing.module';
import { SearchNavigationComponent } from './search-navigation.component';
import { NgZorroAntdModule, NZ_I18N, zh_CN } from 'ng-zorro-antd';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [ SearchNavigationComponent],
  imports: [
    CommonModule,
    SearchNavigationRoutingModule,
    NgZorroAntdModule,
    FormsModule,
    ReactiveFormsModule
  ],
  exports : [SearchNavigationComponent]
})
export class SearchNavigationModule { }
