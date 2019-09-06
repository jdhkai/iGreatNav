import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: '/welcome' },
  { path: 'welcome', loadChildren: () => import('./pages/welcome/welcome.module').then(m => m.WelcomeModule) },
  { path: 'banner', loadChildren: () => import('./pages/banner/banner.module').then(m => m.BannerModule) },
  { path: 'friend-chain', loadChildren: () => import('./pages/friend-chain/friend-chain.module').then(m => m.FriendChainModule) },
  { path: 'navigation-cate', loadChildren: () => import('./pages/navigation-cate/navigation-cate.module').then(m => m.NavigationCateModule) },
  { path: 'navigation-url', loadChildren: () => import('./pages/navigation-url/navigation-url.module').then(m => m.NavigationUrlModule) },
  { path: 'search-navigation', loadChildren: () => import('./pages/search-navigation/search-navigation.module').then(m => m.SearchNavigationModule) }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
