import { Component, Output, EventEmitter, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SidebarComponent } from './sidebar/sidebar.component';

@Component({
  selector: 'app-main-layout',
  standalone: true,
  imports: [CommonModule, SidebarComponent],
  template: `

  <!-- NAVBAR -->
  <div class="navbar" [ngClass]="role">

    <div class="left">
      <span class="brand">EHR System</span>
      <span class="tagline">- Your data is safe with us</span>

      <span class="greeting">
        Hello! {{ userName }}
        <small>Welcome Back!!!</small>
      </span>
    </div>

    <div class="right">
      <button class="logout-btn" (click)="logout()">Logout</button>
    </div>

  </div>

  <div class="layout">

    <app-sidebar 
      [activePage]="activePage"
      [role]="role"
      (menuClick)="menuChange($event)">
    </app-sidebar>

    <div class="main" [ngClass]="role">
      <ng-content></ng-content>
    </div>

  </div>
  `,
  styles: [`

  /* ===== NAVBAR BASE ===== */
  .navbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    color: white;
    padding: 14px 24px;
  }

  /* PATIENT */
.navbar.patient {
  background: linear-gradient(90deg, #0284c7, #22c55e);
}

/* DOCTOR */
.navbar.doctor {
  background: linear-gradient(90deg, #071d58, #2969d1);
}

/* NURSE */
.navbar.nurse {
  background: linear-gradient(90deg, #047857, #34d399);
}

/* ADMIN */
.navbar.admin {
  background: linear-gradient(90deg, #3f2666, #755eb9);
}

  /* ===== LEFT ===== */
  .left {
    display: flex;
    align-items: center;
    gap: 18px;
  }

  .brand {
    font-family: 'Playfair Display', serif;
    font-size: 26px;
    font-weight: 600;
    // color: #38bdf8;
  }

  .tagline {
    font-size: 15px;
    opacity: 0.8;
  }

  .greeting {
    margin-left: 20px;
    font-size: 20px;
  }

  .greeting small {
    display: block;
    opacity: 0.7;
    font-size: 15px;
  }

  /* ===== BUTTON ===== */
  .logout-btn {
    background: #ef4444;
    border: none;
    padding: 6px 14px;
    border-radius: 8px;
    color: white;
    cursor: pointer;
  }

  /* ===== LAYOUT ===== */
  .layout {
    display: flex;
    height: calc(100vh - 60px);
  }

  .main {
  flex: 1;
  padding: 24px;
  overflow-y: auto;
}

/* ROLE BASED BACKGROUND */
.main.patient {
  background: linear-gradient(135deg, #e0f2fe, #dcfce7);
}

.main.doctor {
  background: linear-gradient(135deg, #e0e7ff, #f0f9ff);
}

.main.nurse {
  background: linear-gradient(135deg, #ecfdf5, #d1fae5);
}

.main.admin {
  background: linear-gradient(135deg, #f5f3ff, #ede9fe);
}

/* ===== TEXT COLOR PER ROLE ===== */
/* PATIENT */
.navbar.patient .brand { color: whitesmoke; }
.navbar.patient .tagline { color: whitesmoke; }
.navbar.patient .greeting { color: whitesmoke; }

/* DOCTOR */
.navbar.doctor .brand { color: whitesmoke; }
.navbar.doctor .tagline { color: whitesmoke; }
.navbar.doctor .greeting { color: whitesmoke; }

/* NURSE */
.navbar.nurse .brand { color: whitesmoke; }
.navbar.nurse .tagline { color: whitesmoke; }
.navbar.nurse .greeting { color: whitesmoke; }

/* ADMIN */
.navbar.admin .brand { color: whitesmoke; }
.navbar.admin .tagline { color: whitesmoke; }
.navbar.admin .greeting { color: whitesmoke; }

  `]
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