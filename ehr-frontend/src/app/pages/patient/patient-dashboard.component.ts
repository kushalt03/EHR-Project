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
  
  template: `
<app-main-layout (menuClick)="handleMenu($event)">

  <!-- ================= DASHBOARD ================= -->
  <div *ngIf="currentPage === 'dashboard'">

    <h2>Patient Dashboard</h2>

    <!-- 🔥 STATS ROW -->
    <div class="stats-row">

      <div class="stat-card">
        <h4>🧾 Visits</h4>
        <p>12</p>
      </div>

      <div class="stat-card">
        <h4>💊 Prescriptions</h4>
        <p>3</p>
      </div>

      <div class="stat-card">
        <h4>🧪 Lab Reports</h4>
        <p>{{ lab ? 1 : 0 }}</p>
      </div>

      <div class="stat-card">
        <h4>💰 Pending Bills</h4>
        <p>{{ billing && !billing[1] ? '1' : '0' }}</p>
      </div>

    </div>

    <!-- 🔥 MAIN GRID -->
    <div *ngIf="data" class="dashboard-grid">

      <!-- 🧍 PERSONAL -->
      <div class="card blue">
        <h3>🧍 Personal Info</h3>
        <p><b>Name:</b> {{data[1]}} {{data[2]}}</p>
        <p><b>Gender:</b> {{data[3]}}</p>
        <p><b>DOB:</b> {{data[4]}}</p>
        <p><b>Contact:</b> {{data[5]}}</p>
      </div>

      <!-- ❤️ VITALS -->
      <div class="card gray" *ngIf="vitals">
        <h3>❤️ Vitals</h3>
        <p><b>Temperature:</b> {{vitals[0]}}</p>
        <p><b>Heart Rate:</b> {{vitals[1]}}</p>
        <p><b>SpO2:</b> {{vitals[2]}}</p>
      </div>

      <!-- 💊 MEDS -->
      <div class="card green" *ngIf="meds">
        <h3>💊 Medication</h3>
        <p>{{meds[0]}}</p>
        <p>₹{{meds[1]}}</p>
      </div>

      <!-- 🧪 LAB -->
      <div class="card gray" *ngIf="lab">
        <h3>🧪 Lab</h3>
        <p>{{lab[0]}}</p>
        <p>{{lab[1]}}</p>
      </div>

      <!-- 💰 BILLING -->
      <div class="card yellow" *ngIf="billing">
        <h3>💰 Billing</h3>
        <p>₹{{billing[0]}}</p>
        <p>{{billing[1] ? 'Paid' : 'Pending'}}</p>
      </div>

      <!-- 🔥 ALERTS -->
      <div class="card red">
        <h3>⚠️ Alerts</h3>

        <p *ngIf="vitals && vitals[1] > 100">
          High Heart Rate detected
        </p>

        <p *ngIf="billing && !billing[1]">
          Payment Pending
        </p>

        <p *ngIf="(!vitals || vitals[1] <= 100) && (billing && billing[1])">
          No alerts so far... just chill 😎
        </p>
      </div>

    </div>
  </div>

  <!-- ================= PATIENT FORM ================= -->
  <div *ngIf="currentPage === 'patient'">
    <app-patient-form></app-patient-form>
  </div>

  <!-- ================= TEAM ================= -->
  <div *ngIf="currentPage === 'team'">
    <app-team></app-team>
  </div>

  <!-- ================= ABOUT ================= -->
  <div *ngIf="currentPage === 'about'">
    <app-about></app-about>
  </div>

  <!-- ================= FAQ ================= -->
  <div *ngIf="currentPage === 'faq'">
    <app-faq></app-faq>
  </div>

  <!-- ================= HELP ================= -->
  <div *ngIf="currentPage === 'help'">
    <app-help></app-help>
  </div>

</app-main-layout>
`,

  styles: [`

h2 {
  margin-bottom: 15px;
  color: #0369a1;
  font-weight: 600;
}

/* 🔥 STATS ROW */
.stats-row {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
  margin-bottom: 20px;
}

.stat-card {
  background: linear-gradient(135deg, #38bdf8, #22c55e);
  color: white;
  padding: 18px;
  border-radius: 14px;
  text-align: center;
  box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

.stat-card h4 {
  margin-bottom: 6px;
  font-size: 14px;
  opacity: 0.9;
}

.stat-card p {
  font-size: 22px;
  font-weight: bold;
}

/* 🔥 GRID */
.dashboard-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 25px;
}

/* 🔥 CARD HOVER */
.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 25px rgba(0,0,0,0.12);
}

.card h3 {
  margin-bottom: 10px;
  color: #0c4a6e;
}

.card p {
  margin: 6px 0;
}

/* 🔥 ALERT CARD */
.card.red {
  background: linear-gradient(135deg, #fecaca, #fee2e2);
}

`]
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