import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SearchNavigationComponent } from './search-navigation.component';

const routes: Routes = [
  {
    path: '', component: SearchNavigationComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SearchNavigationRoutingModule { }
