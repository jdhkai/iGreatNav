import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FriendChainComponent } from './friend-chain.component'


const routes: Routes = [
  {
    path: '', component: FriendChainComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class FriendChainRoutingModule { }
