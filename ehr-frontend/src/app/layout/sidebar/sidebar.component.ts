import { Component, Output, EventEmitter, Input } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
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