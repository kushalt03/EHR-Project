import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { WebClientService } from '../../core/services/web-client.service';
import { MainLayoutComponent } from '../../layout/main-layout.component';
import { PatientFormComponent } from "../patient/patient-form/patient-form.component";
import { TeamComponent } from '../../shared/team/team.component';
import { AboutComponent } from '../../shared/about/about.component';
import { FaqComponent } from '../../shared/faq/faq.component';
import { HelpComponent } from '../../shared/help/help.component';

@Component({
  selector: 'app-nurse-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule, MainLayoutComponent, PatientFormComponent, TeamComponent, AboutComponent, FaqComponent, HelpComponent],
  templateUrl: './nurse-dashboard.component.html',
  styleUrls: ['./nurse-dashboard.component.css']
})
export class NurseDashboardComponent implements OnInit {

  patients: any[] = [];
  selectedPatient: any = null;
  details: any[] = [];

  section: string = '';
  nurseName: string = '';
  currentPage = 'dashboard';

  vitals = {
    temperature: '',
    heart_rate: '',
    spo2: '',
    pain_score: '',
    gcs_score: ''
  };

  constructor(private api: WebClientService) {}

  ngOnInit() {
    const nurseId = Number(localStorage.getItem('id'));

    // 🔥 NAME FETCH
    this.api.getStaffById(nurseId).subscribe((res: any) => {
      this.nurseName = res[0][1] + " " + res[0][2];
    });

    // 🔥 SECTION AUTO
    if (nurseId === 6) this.section = 'OPD';
    else if (nurseId === 7) this.section = 'IPD';
    else this.section = 'EMERGENCY';

    this.fetchPatients();
  }

  fetchPatients() {
    this.api.getNursePatients(this.section).subscribe((res: any) => {
      this.patients = res || [];
    });
  }

  selectPatient(p: any) {
    this.selectedPatient = p;

    this.api.getPatientDetails(p[0]).subscribe((res: any) => {
      this.details = res;
    });
  }

  submitVitals() {

    const payload = {
      mpid: this.selectedPatient[0],
      temperature: Number(this.vitals.temperature),
      heart_rate: Number(this.vitals.heart_rate),
      spo2: Number(this.vitals.spo2),
      pain_score: Number(this.vitals.pain_score),
      gcs_score: Number(this.vitals.gcs_score)
    };

    this.api.addVitals(payload).subscribe(() => {
      alert("Vitals added successfully");

      this.vitals = {
        temperature: '',
        heart_rate: '',
        spo2: '',
        pain_score: '',
        gcs_score: ''
      };
    });
  }

  // 🔥 SIDEBAR FIX
  handleMenu(page: string) {
    this.selectedPatient = null;
    this.details = [];
    this.currentPage = page;

    if (page === 'dashboard') {
      this.fetchPatients();
    }
  }
}