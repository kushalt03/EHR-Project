import { Component, Output, EventEmitter, Input } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [CommonModule],
  template: `
<div class="sidebar" [ngClass]="role">

  <!-- LOGO -->
  <div class="logo">
    <img src="images/page_logo.png" alt="EHR Logo" />
  </div>

  <!-- MENU -->
  <ul>
    <li 
      *ngFor="let item of menu"
      (click)="select(item.key)"
      [class.active]="activePage === item.key">

      {{ item.icon }} {{ item.label }}
    </li>
  </ul>

</div>
`,
  styles: [`
.sidebar {
  width: 220px;
  color: white;
  padding: 20px;
  height: 100%;

  display: flex;
  flex-direction: column;
  align-items: center;
}

/* ROLE COLORS */
.sidebar.patient { background: #020617; }
.sidebar.doctor { background: #020617; }
.sidebar.nurse { background: #022c22; }
.sidebar.admin { background: #0f172a; }

/* LOGO */
.logo img {
  width: 160px;
  height: auto;
  margin-bottom: 30px;

  filter: drop-shadow(0 4px 10px rgba(0,0,0,0.4));
  transition: 0.3s;
}

.logo img:hover {
  transform: scale(1.05);
}

/* MENU */
ul {
  list-style: none;
  padding: 0;
  width: 100%;
}

li {
  padding: 12px;
  cursor: pointer;
  border-radius: 10px;
  transition: 0.2s;
}

li:hover {
  background: rgba(255,255,255,0.1);
}

/* ACTIVE STATES */
.sidebar.patient li.active {
  background: linear-gradient(90deg, #0ea5e9, #22c55e);
}

.sidebar.doctor li.active {
  background: linear-gradient(90deg, #1d4ed8, #60a5fa);
}

.sidebar.nurse li.active {
  background: linear-gradient(90deg, #059669, #6ee7b7);
}

.sidebar.admin li.active {
  background: linear-gradient(90deg, #7c3aed, #c084fc);
}
`]
})
export class SidebarComponent {

  @Input() activePage: string = '';
  @Input() role: string = '';
  @Output() menuClick = new EventEmitter<string>();

  menu = [
    { key: 'dashboard', label: 'Dashboard', icon: '📊' },
    { key: 'patient', label: 'Patient Form', icon: '🧑' },
    { key: 'team', label: 'Team Info', icon: '👨‍💻' },
    { key: 'about', label: 'About', icon: 'ℹ️' },
    { key: 'faq', label: 'FAQ', icon: '❓' },
    { key: 'help', label: 'Help', icon: '🆘' }
  ];

  select(page: string) {
    this.menuClick.emit(page);
  }
}