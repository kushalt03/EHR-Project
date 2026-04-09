import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MainLayoutComponent } from '../../layout/main-layout.component';
import { WebClientService } from '../../core/services/web-client.service';
import { PatientFormComponent } from './patient-form/patient-form.component';   
import { TeamComponent } from '../../shared/team/team.component';
import { AboutComponent } from '../../shared/about/about.component';
import { FaqComponent } from '../../shared/faq/faq.component';
import { HelpComponent } from '../../shared/help/help.component';

@Component({
  selector: 'app-patient-dashboard',
  standalone: true,
  imports: [CommonModule, MainLayoutComponent, PatientFormComponent, TeamComponent, AboutComponent, FaqComponent, HelpComponent],
  
  templateUrl: './patient-dashboard.component.html',
  styleUrls: ['./patient-dashboard.component.css']
})
export class PatientDashboardComponent implements OnInit {

  data: any;
  vitals: any;
  meds: any;
  lab: any;
  billing: any;

  // ✅ SINGLE SOURCE OF TRUTH
  currentPage = 'dashboard';

  constructor(private api: WebClientService) {}

  ngOnInit() {
    const mpid = Number(localStorage.getItem('id'));

    console.log("MPID:", mpid);

    this.api.getPatientVitals(mpid).subscribe(res => {
      this.vitals = res;
      console.log("VITALS:", res);
    });

    this.api.getPatientMeds(mpid).subscribe(res => this.meds = res);
    this.api.getPatientLab(mpid).subscribe(res => this.lab = res);
    this.api.getPatientBilling(mpid).subscribe(res => this.billing = res);

    this.api.getPatientDashboard(mpid).subscribe({
      next: (res: any) => {
        console.log("DATA:", res);
        this.data = res;
      },
      error: (err) => {
        console.error("API ERROR:", err);
      }
    });
  }

  // ✅ ONLY THIS FUNCTION
  handleMenu(page: string) {
    console.log("CLICK:", page);
    this.currentPage = page;
  }
}