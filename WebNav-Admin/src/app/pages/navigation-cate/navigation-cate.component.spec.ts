import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NavigationCateComponent } from './navigation-cate.component';

describe('NavigationCateComponent', () => {
  let component: NavigationCateComponent;
  let fixture: ComponentFixture<NavigationCateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NavigationCateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NavigationCateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
