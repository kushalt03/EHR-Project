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
  templateUrl: './doctor-dashboard.component.html',
  styleUrls: ['./doctor-dashboard.component.css']
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
    console.log(this.patientDetails);
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