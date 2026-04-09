import { Component, Output, EventEmitter, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SidebarComponent } from './sidebar/sidebar.component';

@Component({
  selector: 'app-main-layout',
  standalone: true,
  imports: [CommonModule, SidebarComponent],
  templateUrl: './main-layout.component.html',
  styleUrls: ['./main-layout.component.css'] 
})
export class MainLayoutComponent implements OnInit {

  @Output() menuClick = new EventEmitter<string>();

  userName = 'User';
  activePage = 'dashboard';
  role = 'patient'; // default

  ngOnInit() {
    const name = localStorage.getItem('name') || '';
    const surname = localStorage.getItem('surname') || '';
    const role = localStorage.getItem('role') || 'patient';

    this.role = role;

    if (name && surname) {
      this.userName = role === 'doctor'
        ? `Dr. ${name} ${surname}`
        : `${name} ${surname}`;
    }
  }

  menuChange(page: string) {
    this.activePage = page;
    this.menuClick.emit(page);
  }

  logout() {
    localStorage.clear();
    window.location.href = '/#/login';
  }
}