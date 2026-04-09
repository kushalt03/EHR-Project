import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WebClientService } from '../../core/services/web-client.service';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { PatientFormComponent } from '../patient/patient-form/patient-form.component';
import { MainLayoutComponent } from '../../layout/main-layout.component';
import { Chart } from 'chart.js/auto';
import { TeamComponent } from '../../shared/team/team.component';
import { AboutComponent } from '../../shared/about/about.component';
import { FaqComponent } from '../../shared/faq/faq.component';
import { HelpComponent } from '../../shared/help/help.component';

@Component({
  selector: 'app-doctor-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule, PatientFormComponent, MainLayoutComponent, TeamComponent, AboutComponent, FaqComponent, HelpComponent],
  template: `

  <app-main-layout (menuClick)="handleMenu($event)">

    <!-- ================= DASHBOARD ================= -->
    <div *ngIf="currentPage === 'dashboard'">

      <!-- LIST -->
      <div *ngIf="!selectedPatient">

        <h2>Here are your patients for today</h2>

        <!-- CARDS -->
        <div class="cards">
          <div 
            *ngFor="let c of counts" 
            class="card"
            (click)="filterByType(c[0])">

            <h3>{{ c[0] }}</h3>
            <p>{{ c[1] }}</p>
          </div>
        </div>

        <!-- FILTER -->
        <select [(ngModel)]="selectedType" (change)="fetchPatients()">
          <option value="">Select Type</option>
          <option value="OPD">OPD</option>
          <option value="IPD">IPD</option>
          <option value="EMERGENCY">EMERGENCY</option>
        </select>

        <!-- EMPTY STATE -->
        <div *ngIf="selectedType && !patients.length" class="empty">
          No patients found for {{ selectedType }}
        </div>

        <!-- TABLE -->
        <table *ngIf="patients.length">
          <tr>
            <th>MPID</th>
            <th>Name</th>
            <th>DOB</th>
            <th>Gender</th>
            <th>Mobile</th>
          </tr>

          <tr *ngFor="let p of patients" (click)="openPatient(p)" class="row">
            <td>{{ p[0] }}</td>
            <td>{{ p[1] }} {{ p[2] }}</td>
            <td>{{ p[3] }}</td>
            <td>{{ p[4] }}</td>
            <td>{{ p[5] }}</td>
          </tr>
        </table>

      </div>

      <!-- DETAIL -->
      <div *ngIf="selectedPatient" class="patient-detail">

        <!-- 🔥 BACK BUTTON (TOP LEFT) -->
        <button class="back-btn" (click)="goBack()">⬅ Back</button>

        <!-- 🔥 INFO + DIAGNOSIS -->
        <div class="detail-grid">

          <!-- PERSONAL INFO -->
          <div class="card white highlight">
            <h2>{{ selectedPatient[1] }} {{ selectedPatient[2] }}</h2>
            <p><b>MPID:</b> {{ selectedPatient[0] }}</p>
            <p><b>DOB:</b> {{ selectedPatient[3] }}</p>
            <p><b>Gender:</b> {{ selectedPatient[4] }}</p>
            <p><b>Mobile:</b> {{ selectedPatient[5] }}</p>
          </div>

          <!-- CLINICAL INFO -->
          <div class="card white" *ngIf="patientDetails && patientDetails.length">
            <h3>Clinical Info</h3>
            <p><b>Diagnosis:</b> {{ patientDetails[0][5] }}</p>
            <p><b>Dosage:</b> {{ patientDetails[0][6] }}</p>
            <p><b>Temperature:</b> {{ patientDetails[0][7] }}</p>
            <p><b>BP:</b> {{ patientDetails[0][8] }}</p>
          </div>

        </div>

        <!-- 🔥 FULL WIDTH VITALS -->
        <div class="card white vitals-full">
          <h3>Vitals Graph</h3>
          <canvas id="vitalsChart"></canvas>
        </div>

      </div>

    </div>

    <!-- ================= PATIENT FORM ================= -->
    <div *ngIf="currentPage === 'patient'">
      <app-patient-form></app-patient-form>
    </div>

    <!-- ================= TEAM ================= -->
    <div *ngIf="currentPage === 'team'" class="card white">
      <app-team></app-team>
    </div>

    <!-- ================= ABOUT ================= -->
    <div *ngIf="currentPage === 'about'" class="card white">
      <app-about></app-about>
    </div>

    <!-- ================= FAQ ================= -->
    <div *ngIf="currentPage === 'faq'" class="card white">
      <app-faq></app-faq>
    </div>

    <!-- ================= HELP ================= -->
    <div *ngIf="currentPage === 'help'" class="card white">
      <app-help></app-help>
    </div>

  </app-main-layout>
  `,
  styles: [`

 /* ================= TITLE ================= */
h2 {
  text-align: center;
  font-family: 'Playfair Display', serif;
  margin-bottom: 25px;
  color: #1e3a8a;
}

/* ================= TOP CARDS ================= */
.cards {
  display: flex;
  gap: 20px;
  margin-bottom: 30px;
}

.cards .card {
  flex: 1;
  text-align: center;
  cursor: pointer;

  padding: 25px;
  border-radius: 18px;

  /* 🔥 GLOSSY LOOK */
  background: linear-gradient(135deg, #93c5fd, #60a5fa);

  border: 1px solid rgba(255,255,255,0.4);

  box-shadow:
    0 10px 25px rgba(0,0,0,0.12),
    inset 0 2px 4px rgba(255,255,255,0.4);

  backdrop-filter: blur(6px);

  transition: all 0.25s ease;
}

.cards .card:hover {
  transform: translateY(-6px) scale(1.03);
  box-shadow:
    0 15px 35px rgba(0,0,0,0.18),
    inset 0 2px 6px rgba(255,255,255,0.5);
}

/* ================= SELECT ================= */
select {
  padding: 10px 12px;
  border-radius: 10px;
  border: 1px solid #cbd5e1;
  margin-bottom: 20px;
  background: white;
  cursor: pointer;
}

/* ================= TABLE ================= */
table {
  width: 100%;
  border-radius: 14px;
  overflow: hidden;

  background: rgba(255,255,255,0.9);
  backdrop-filter: blur(8px);

  box-shadow: 0 10px 30px rgba(0,0,0,0.12);
}

/* HEADER */
th {
  background: linear-gradient(90deg, #1e3a8a, #3b82f6);
  color: white;
  padding: 14px;
  text-align: left;
  font-weight: 500;
}

/* ROWS */
td {
  padding: 12px;
  border-bottom: 1px solid #e2e8f0;
}

/* REMOVE LAST BORDER */
tr:last-child td {
  border-bottom: none;
}

/* ZEBRA EFFECT */
tr:nth-child(even) {
  background: rgba(248,250,252,0.7);
}

/* HOVER EFFECT */
.row:hover {
  background: #e0f2fe;
  transform: scale(1.01);
  transition: 0.2s;
}

/* ================= EMPTY STATE ================= */
.empty {
  margin-top: 20px;
  padding: 15px;
  background: #fef3c7;
  border-radius: 10px;
  color: #92400e;
  text-align: center;
}

/* ================= DETAIL VIEW ================= */
.patient-detail {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

/* 🔥 BACK BUTTON TOP LEFT */
.back-btn {
  align-self: flex-start;

  background: linear-gradient(135deg, #2563eb, #3b82f6);
  color: white;

  border: none;
  padding: 10px 16px;
  border-radius: 10px;

  cursor: pointer;
  transition: 0.2s;
}

.back-btn:hover {
  background: #1e40af;
}

/* 🔥 SIDE BY SIDE SECTION */
.detail-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
}

/* 🔥 FULL WIDTH VITALS */
.vitals-full {
  width: 100%;
}

/* CARD POLISH */
.card.white {
  background: rgba(255,255,255,0.9);
  backdrop-filter: blur(6px);

  border-radius: 16px;
  padding: 20px;

  box-shadow:
    0 10px 25px rgba(0,0,0,0.08),
    inset 0 1px 2px rgba(255,255,255,0.6);
}

/* PROFILE LEFT BORDER */
.highlight {
  border-left: 6px solid #2563eb;
}

/* ================= BACK BUTTON ================= */
.back-btn {
  background: linear-gradient(135deg, #2563eb, #3b82f6);
  color: white;
  border: none;
  padding: 10px 16px;
  border-radius: 10px;
  cursor: pointer;
  height: fit-content;
  transition: 0.2s;
}

.back-btn:hover {
  background: #1e40af;
}

/* ================= CHART SECTION ================= */
.vitals-section {
  margin-top: 10px;
}

  `]
})
export class DoctorDashboardComponent {

  counts: any[] = [];
  patients: any[] = [];
  selectedType: string = '';
  chart: any;
  doctorId: number = 0;
  selectedPatient: any = null;
  patientDetails: any[] = [];
  currentPage: string = 'dashboard';

  constructor(private api: WebClientService, private router: Router) {}

  ngOnInit() {
    this.doctorId = Number(localStorage.getItem('id'));
    this.fetchCounts();
  }

  fetchCounts() {
    this.api.getDoctorCounts(this.doctorId).subscribe((res: any) => {
      this.counts = res;
    });
  }

  fetchPatients() {
    if (!this.selectedType) return;

    this.api.getDoctorPatients(this.doctorId, this.selectedType)
      .subscribe({
        next: (res: any) => {
          this.patients = res || [];
        },
        error: () => {
          this.patients = [];
        }
      });
  }

  handleMenu(page: string) {
    this.currentPage = page;

    // 🔥 reset everything properly
    this.selectedPatient = null;
    this.patientDetails = [];
    this.patients = [];
    this.selectedType = '';

    if (page === 'dashboard') {
      this.fetchCounts();
    }
  }

  filterByType(type: string) {
    this.selectedType = type;
    this.fetchPatients();
  }

  openPatient(p: any) {
    this.selectedPatient = p;

    this.api.getPatientDetails(p[0]).subscribe({
      next: (res: any) => {
        this.patientDetails = res;

        setTimeout(() => {
          this.renderChart();
        }, 100);
      }
    });
  }

  renderChart() {

    const mpid = this.selectedPatient?.[0];

    this.api.getVitalsByPatient(mpid).subscribe((data: any) => {

      if (!data || !data.length) return;

      console.log(data);

      const labels = data.map((v: any) => new Date(v[0]).toLocaleTimeString());

      const temp = data.map((v: any) => v[1]);
      const heart = data.map((v: any) => v[2]);
      const spo2 = data.map((v: any) => v[3]);
      const pain = data.map((v: any) => v[4]);
      const gcs = data.map((v: any) => v[5]);

      if (this.chart) this.chart.destroy();

      this.chart = new Chart("vitalsChart", {
        type: 'line',
        data: {
          labels,
          datasets: [
            { label: 'Temp', data: temp },
            { label: 'Heart Rate', data: heart },
            { label: 'SpO2', data: spo2 },
            { label: 'Pain Score', data: pain, borderDash: [5,5] },
            { label: 'GCS', data: gcs, borderDash: [2,2] }
          ]
        },
        options: {
          responsive: true,
          scales: {
            y: { beginAtZero: true }
          }
        }
      });

    });
  }

  goBack() {
    this.selectedPatient = null;
  }
}