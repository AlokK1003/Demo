import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { UserleaveapplyComponent } from './userleaveapply.component';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    component: UserleaveapplyComponent
  }
];

@NgModule({
  imports: [
    CommonModule,
    //OrdersRoutingModule
    RouterModule.forChild(routes),
    FormsModule,
    ReactiveFormsModule,
  ],
  declarations: [UserleaveapplyComponent],
  exports: [RouterModule]
})
export class UserLeaveApplyModule {}
