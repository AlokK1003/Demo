import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Observable } from 'rxjs';
import { UserLeaveService } from '../userleave/userleave.service';
import { UserLeave } from '../Models/UserLeave';
import { Router } from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-userleave',
  templateUrl: './userleave.component.html',
  styleUrls: ['./userleave.component.css']
})
export class UserleaveComponent implements OnInit {
  UserLeave?: Observable<UserLeave[]>;
  constructor(private formbulider: FormBuilder,
    private userLeaveServic: UserLeaveService,private router: Router,
    private jwtHelper : JwtHelperService,private toastr: ToastrService) { }

  ngOnInit(): void {
    if(localStorage.getItem('UserId')!=null){
      this.getList(localStorage.getItem('UserId') as string);
    }
  }
  getList(id: string) {
    this.UserLeave = this.userLeaveServic.getList(id);
  }
  loadUserApplyLeave(){
    this.router.navigate(["/userleaveapply"]);
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
