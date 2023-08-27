import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Observable } from 'rxjs';
import { UserdashboardService } from '../userdashboard/userdashboard.service';
import { UserDashboard } from '../Models/UserDashboard';
import { Router } from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-userdashboard',
  templateUrl: './userdashboard.component.html',
  styleUrls: ['./userdashboard.component.css']
})
export class UserdashboardComponent implements OnInit {
  userName?="";
  userYear?=0;
  remainingLeave?=0;
  totalLeave?=0;
  availedLeave?=0;
  pendingApprovalLeave?=0;
  constructor(private formbulider: FormBuilder,
     private userdashboardService: UserdashboardService,private router: Router,
     private jwtHelper : JwtHelperService,private toastr: ToastrService) { }

  ngOnInit(): void {
    if(localStorage.getItem('UserId')!=null){
      this.UserDashboardDeatils(localStorage.getItem('UserId') as string);
    }
    
    
  }
  UserDashboardDeatils(id: string) {
    this.userdashboardService.getUserDashboardDetailsById(id).subscribe(Result => {
       if(Result!=null && Result!=undefined){
         this.userName = Result.userName;
         this.userYear=Result.userYear;
         this.totalLeave=Result.totalLeave;
         this.remainingLeave=Result.remainingLeave;
         this.availedLeave=Result.availedLeave;
         this.pendingApprovalLeave=Result.pendingApprovalLeave;
       }
    });
  }
  public logOut = () => {
    localStorage.removeItem("jwt");
    this.router.navigate(["/"]);
  }
  isUserAuthenticated() {
    const token = localStorage.getItem("jwt");
    if (token && !this.jwtHelper.isTokenExpired(token)) {
      return true;
    }
    else {
      return false;
    }
  }

}
