import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { WebClientService } from '../../core/services/web-client.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent {

  username = '';
  password = '';
  error = '';

  constructor(private webClient: WebClientService, private router: Router) {}

  login() {
    this.webClient.login(this.username, this.password).subscribe({
      next: (res: any) => {

        console.log("LOGIN RESPONSE:", res); // debug

        // ✅ STORE EVERYTHING
        localStorage.setItem('id', res.id);
        localStorage.setItem('role', res.role);
        localStorage.setItem('name', res.first_name || 'User');
        localStorage.setItem('surname', res.last_name || '');

        // ✅ NAVIGATION
        if (res.role === 'doctor') this.router.navigate(['/doctor']);
        else if (res.role === 'nurse') this.router.navigate(['/nurse']);
        else if (res.role === 'admin') this.router.navigate(['/admin']);
        else this.router.navigate(['/patient']);

      },
      error: () => {
        this.error = "Invalid credentials";
      }
    });
  }

}