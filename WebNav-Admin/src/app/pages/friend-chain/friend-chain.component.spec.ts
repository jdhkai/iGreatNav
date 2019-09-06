import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FriendChainComponent } from './friend-chain.component';

describe('FriendChainComponent', () => {
  let component: FriendChainComponent;
  let fixture: ComponentFixture<FriendChainComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FriendChainComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FriendChainComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
