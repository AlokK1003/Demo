import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserleaveapplyComponent } from './userleaveapply.component';

describe('UserleaveapplyComponent', () => {
  let component: UserleaveapplyComponent;
  let fixture: ComponentFixture<UserleaveapplyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserleaveapplyComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserleaveapplyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
