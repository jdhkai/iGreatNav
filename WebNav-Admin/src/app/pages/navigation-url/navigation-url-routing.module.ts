import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { NavigationUrlComponent } from './navigation-url.component';

const routes: Routes = [
  {
    path: '', component: NavigationUrlComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class NavigationUrlRoutingModule { }
