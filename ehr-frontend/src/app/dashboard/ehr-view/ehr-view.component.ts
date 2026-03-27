import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { WebClientService } from '../../core/services/web-client.service';

@Component({
  selector: 'app-ehr-view',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="container">
      <h2>EHR Dashboard</h2>

      <p><b>Logged in as:</b> {{ role }}</p>

      <input [(ngModel)]="mpid" placeholder="Enter Patient ID" />

      <button (click)="fetchData()">Fetch Data</button>

      <!-- DOCTOR VIEW -->
      <div *ngIf="role === 'doctor' && data">
        <h3>Doctor View</h3>
        <table border="1">
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

      <!-- NURSE VIEW -->
      <div *ngIf="role === 'nurse' && data">
        <h3>Nurse View</h3>
        <table border="1">
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

      <!-- PHARMACIST VIEW -->
      <div *ngIf="role === 'pharmacist' && data">
        <h3>Pharmacist View</h3>
        <table border="1">
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

      <!-- ADMIN VIEW -->
      <div *ngIf="role === 'admin' && data">
        <h3>Admin View</h3>
        <table border="1">
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
  `,
  styles: [`
  .container {
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 2px 10px rgba(0,0,0,0.1);
  }

  input {
    padding: 8px;
    margin-right: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
  }

  button {
    background: #27ae60;
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 5px;
  }

  table {
    width: 100%;
    margin-top: 15px;
    border-collapse: collapse;
  }

  th {
    background: #2c3e50;
    color: white;
  }

  th, td {
    padding: 10px;
    text-align: left;
  }

  tr:nth-child(even) {
    background: #f2f2f2;
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