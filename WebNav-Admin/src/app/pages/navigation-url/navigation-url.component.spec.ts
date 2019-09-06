import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NavigationUrlComponent } from './navigation-url.component';

describe('NavigationUrlComponent', () => {
  let component: NavigationUrlComponent;
  let fixture: ComponentFixture<NavigationUrlComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NavigationUrlComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NavigationUrlComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
