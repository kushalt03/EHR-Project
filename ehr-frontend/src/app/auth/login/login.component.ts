import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { WebClientService } from '../../core/services/web-client.service';
import { Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule, CommonModule],
  template: `
    <div class="login-container">
      <h2>Login</h2>

      <input [(ngModel)]="username" placeholder="Username" />
      <input [(ngModel)]="password" type="password" placeholder="Password" />

      <button (click)="login()">Login</button>

      <p *ngIf="error" style="color:red">{{ error }}</p>
    </div>
  `,
  styles: [`
    .login-container { padding: 20px; }
    input { display:block; margin:10px; padding:5px; }
    button { padding:6px 12px; }
  `]
})
export class LoginComponent {
    @Output() loginSuccess = new EventEmitter<void>();

  username = '';
  password = '';
  error = '';

  constructor(private webClient: WebClientService) {}

  login() {
  this.webClient.login({
    username: this.username,
    password: this.password
  }).subscribe({
    next: (res: any) => {
      if(res.role) {
        localStorage.setItem('role', res.role);
        localStorage.setItem('staffId', res.staffId);

        this.loginSuccess.emit(); 
      } else {
        this.error = "Invalid credentials";
      }
    },
    error: () => this.error = "Login failed"
  });
}
}