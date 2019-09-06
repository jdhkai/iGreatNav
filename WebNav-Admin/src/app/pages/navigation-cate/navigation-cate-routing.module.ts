import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { NavigationCateComponent } from './navigation-cate.component';

const routes: Routes = [
  {
    path: '', component: NavigationCateComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class NavigationCateRoutingModule { }
