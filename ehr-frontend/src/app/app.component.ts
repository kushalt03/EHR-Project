import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EhrViewComponent } from './dashboard/ehr-view/ehr-view.component';
import { PatientFormComponent } from './patient/patient-form/patient-form.component';
import { LoginComponent } from './auth/login/login.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, EhrViewComponent, PatientFormComponent, LoginComponent],
  template: `
  <div class="app-container">

    <header>
      <h1>EHR System</h1>
      <button *ngIf="isLoggedIn" (click)="logout()">Logout</button>
    </header>

    <app-login 
      *ngIf="!isLoggedIn" 
      (loginSuccess)="onLoginSuccess()">
    </app-login>

    <div *ngIf="isLoggedIn" class="dashboard">
      <app-ehr-view></app-ehr-view>
      <app-patient-form></app-patient-form>
    </div>

  </div>
`,
styles: [`
  .app-container {
    font-family: Arial, sans-serif;
    background: #f4f6f9;
    min-height: 100vh;
  }

  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #2c3e50;
    color: white;
    padding: 15px 30px;
  }

  .dashboard {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    padding: 20px;
  }

  button {
    background: #3498db;
    border: none;
    color: white;
    padding: 8px 15px;
    border-radius: 5px;
    cursor: pointer;
  }
`]
})

export class AppComponent {

  isLoggedIn = false;

  ngOnInit() {
    this.checkLogin();
  }

  checkLogin() {
    this.isLoggedIn = !!localStorage.getItem('role');
  }

  onLoginSuccess() {
    this.isLoggedIn = true;
  }

  logout() {
    localStorage.clear();
    this.isLoggedIn = false;
  }
}