import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { UserLeave } from '../Models/UserLeave';
import configurl from '../../assets/config/config.json'

@Injectable({
  providedIn: 'root'
})
export class UserLeaveService {

  url = configurl.apiServer.url + '/api/userleave/';
  constructor(private http: HttpClient) { }
  getList(id: string): Observable<UserLeave[]> {
    return this.http.get<UserLeave[]>(this.url + 'List?userId=' + id);
  }
  postData(userLeaveData: UserLeave): Observable<UserLeave> {
    debugger;
    const httpHeaders = { headers:new HttpHeaders({'Content-Type': 'application/json'}) };
    return this.http.post<UserLeave>(this.url + 'CreateLeave', userLeaveData, httpHeaders);
  }
}
