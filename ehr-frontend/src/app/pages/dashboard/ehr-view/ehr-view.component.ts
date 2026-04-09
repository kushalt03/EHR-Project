import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { WebClientService } from '../../../core/services/web-client.service';

@Component({
  selector: 'app-ehr-view',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="container">

      <h2>EHR Dashboard</h2>

      <div class="role-badge">Role: {{ role }}</div>

      <!-- 🔥 STATS CARDS -->
      <div class="stats">
        <div class="card">
          <h3>Patients</h3>
          <p>120</p>
        </div>
        <div class="card">
          <h3>Doctors</h3>
          <p>12</p>
        </div>
        <div class="card">
          <h3>Rooms</h3>
          <p>30</p>
        </div>
        <div class="card">
          <h3>Medicines</h3>
          <p>85</p>
        </div>
      </div>

      <!-- 🔥 SEARCH -->
      <form (ngSubmit)="fetchData()" class="search-box">
        <input [(ngModel)]="mpid" name="mpid" placeholder="Enter Patient ID" />
        <button type="submit">Fetch Data</button>
      </form>

      <!-- 🔥 TABLE -->
      <div *ngIf="data" class="table-container">

        <!-- DOCTOR -->
        <div *ngIf="role === 'doctor'">
          <h3>Doctor View</h3>
          <table>
            <tr>
              <th>Name</th>
              <th>Department</th>
              <th>Notes</th>
            </tr>
            <tr *ngFor="let d of data">
              <td>{{ d[0] }} {{ d[1] }}</td>
              <td>{{ d[2] }}</td>
              <td>{{ d[4] }}</td>
            </tr>
          </table>
        </div>

        <!-- NURSE -->
        <div *ngIf="role === 'nurse'">
          <h3>Nurse View</h3>
          <table>
            <tr>
              <th>Name</th>
              <th>Temp</th>
              <th>BP</th>
              <th>Room</th>
            </tr>
            <tr *ngFor="let d of data">
              <td>{{ d[0] }} {{ d[1] }}</td>
              <td>{{ d[2] }}</td>
              <td>{{ d[3] }}</td>
              <td>{{ d[4] }}</td>
            </tr>
          </table>
        </div>

        <!-- PHARMACIST -->
        <div *ngIf="role === 'pharmacist'">
          <h3>Pharmacist View</h3>
          <table>
            <tr>
              <th>Name</th>
              <th>Medicine</th>
            </tr>
            <tr *ngFor="let d of data">
              <td>{{ d[0] }} {{ d[1] }}</td>
              <td>{{ d[2] }}</td>
            </tr>
          </table>
        </div>

        <!-- ADMIN -->
        <div *ngIf="role === 'admin'">
          <h3>Admin View</h3>
          <table>
            <tr>
              <th>Name</th>
              <th>Department</th>
              <th>Cost</th>
            </tr>
            <tr *ngFor="let d of data">
              <td>{{ d[0] }} {{ d[1] }}</td>
              <td>{{ d[2] }}</td>
              <td>{{ d[3] }}</td>
            </tr>
          </table>
        </div>

      </div>

    </div>
  `,
  styles: [`

  .container {
    padding: 20px;
  }

  h2 {
    margin-bottom: 10px;
  }

  /* 🔥 ROLE BADGE */
  .role-badge {
    background: #1e293b;
    color: white;
    display: inline-block;
    padding: 5px 10px;
    border-radius: 8px;
    margin-bottom: 20px;
  }

  /* 🔥 CARDS */
  .stats {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 15px;
    margin-bottom: 20px;
  }

  .card {
    padding: 15px;
    border-radius: 12px;
    background: linear-gradient(135deg, #2563eb, #1e40af);
    color: white;
    text-align: center;
    transition: transform 0.3s;
  }

  .card:hover {
    transform: translateY(-5px);
  }

  .card p {
    font-size: 22px;
    font-weight: bold;
  }

  /* 🔥 SEARCH */
  .search-box {
    margin-bottom: 20px;
  }

  input {
    padding: 8px;
    margin-right: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
  }

  button {
    background: #16a34a;
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 6px;
    cursor: pointer;
  }

  /* 🔥 TABLE */
  .table-container {
    margin-top: 20px;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    border-radius: 10px;
    overflow: hidden;
  }

  th {
    background: #1e293b;
    color: white;
    padding: 10px;
  }

  td {
    padding: 10px;
  }

  tr:nth-child(even) {
    background: #f1f5f9;
  }

  tr:hover {
    background: #e2e8f0;
  }

  `]
})
export class EhrViewComponent {

  mpid: number = 1;
  role: string = '';
  data: any;

  constructor(private webClient: WebClientService) {}

  ngOnInit() {
    this.role = localStorage.getItem('role') || '';
  }

  fetchData() {
    this.webClient.getEhrData(this.mpid, this.role).subscribe({
      next: (res) => this.data = res,
      error: (err) => console.error(err)
    });
  }
}