import { Component, OnInit } from '@angular/core';
import { FormBuilder,FormsModule, Validators,ReactiveFormsModule  } from '@angular/forms';
import { Observable } from 'rxjs';
import { UserLeaveService } from '../userleave/userleave.service';
import { UserLeave } from '../Models/UserLeave';
import { Router } from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-userleaveapply',
  templateUrl: './userleaveapply.component.html',
  styleUrls: ['./userleaveapply.component.css']
})
export class UserleaveapplyComponent implements OnInit {
  leaveForm : any;
  massage = "";

  constructor(private formbulider: FormBuilder,private formGroup:ReactiveFormsModule,
    private userLeaveService: UserLeaveService,private router: Router,
    private jwtHelper : JwtHelperService,private toastr: ToastrService) { }


  ngOnInit(): void {
    this.leaveForm = this.formbulider.group({
      fromDate: ['', [Validators.required]],
      toDate: ['', [Validators.required]],
      leaveType: ['', [Validators.required]],
      natureOfLeave: ['', [Validators.required]],
      reason: ['', [Validators.required]],
      CreatedBy: [localStorage.getItem('UserId') as string, [Validators.required]],
    });
  }
  PostLeaveForm(userleave: UserLeave) {
    const leaveFormMaster = this.leaveForm.value;
    this.userLeaveService.postData(leaveFormMaster).subscribe(
      () => {
        this.leaveForm.reset();
        this.toastr.success('Data Saved Successfully');
        this.router.navigate(["/userleave"]);
      }
    );
  }
  Clear(userleave: UserLeave){
    this.leaveForm.reset();
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
