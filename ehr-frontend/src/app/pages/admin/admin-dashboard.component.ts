import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WebClientService } from '../../core/services/web-client.service';
import { MainLayoutComponent } from '../../layout/main-layout.component';
import { PatientFormComponent } from '../patient/patient-form/patient-form.component';
import { TeamComponent } from '../../shared/team/team.component';
import { AboutComponent } from '../../shared/about/about.component';
import { FaqComponent } from '../../shared/faq/faq.component';
import { HelpComponent } from '../../shared/help/help.component';

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [CommonModule, MainLayoutComponent, PatientFormComponent, TeamComponent, AboutComponent, FaqComponent, HelpComponent],
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.css']
})
export class AdminDashboardComponent implements OnInit {

  stats: any = {};
  data: any[] = [];
  currentPage: string = 'dashboard';
  loading = false;
  selectedRow: any = null;
  detailType: string = '';
  details: any[] = [];

  constructor(private api: WebClientService) {}

  ngOnInit() {
    this.api.getAdminStats().subscribe(res => this.stats = res);
  }

  handleMenu(type: string) {

  this.selectedRow = null;
  this.details = [];
  this.data = [];
  this.loading = false;

  this.currentPage = type;

  // 🔥 DATA PAGES
  const map: any = {
    staff: this.api.getAdminStaff(),
    patients: this.api.getAdminPatients(),
    lab: this.api.getAdminLab(),
    claims: this.api.getAdminClaims(),
    meds: this.api.getAdminMeds()
  };

  if (map[type]) {
    this.loading = true;

    map[type].subscribe((res: any) => {
      this.data = res;
      this.loading = false;
    });
  }
}

  getHeaders() {
    if (!this.data.length) return [];
    const map: any = {
      staff: ['ID','First Name','Last Name','Role'],
      patients: ['MPID','First Name','Last Name','Gender'],
      lab: ['Order ID','MPID','Type','Test','Status'],
      claims: ['Claim ID','MPID','Type','Status'],
      meds: ['Medicine','Stock']
    };
    return map[this.currentPage] || [];
  }

  openDetails(row: any) {
    this.selectedRow = row;
    this.detailType = this.currentPage;

    // for patients, lab, claims → same API
    if (this.currentPage === 'patients' || this.currentPage === 'lab' || this.currentPage === 'claims') {
      this.api.getPatientDetails(row[0]).subscribe((res: any) => {
        this.details = res;
      });
    }
  }

  back() {
    if (this.selectedRow) {
      this.selectedRow = null;
      return;
    }
    this.currentPage = 'dashboard';
  }
}