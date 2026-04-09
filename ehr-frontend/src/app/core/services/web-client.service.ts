import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class WebClientService {

  private patientUrl = 'http://localhost:5000/api/patients';
  private baseUrl = 'http://localhost:5000/api';

  constructor(private http: HttpClient) {}

  // 🔥 PATIENT APIs (UNCHANGED)
  submitPatient(patient: any): Observable<any> {
    return this.http.post(`${this.patientUrl}/submit`, patient);
  }

  getAllPatients(): Observable<any> {
    return this.http.get(this.patientUrl);
  }

  getPatientById(id: number): Observable<any> {
    return this.http.get(`${this.patientUrl}/${id}`);
  }

  updatePatient(id: number, patient: any): Observable<any> {
    return this.http.put(`${this.patientUrl}/${id}`, patient);
  }

  deletePatient(id: number): Observable<any> {
    return this.http.delete(`${this.patientUrl}/${id}`);
  }

  getEhrData(mpid: number, role: string): Observable<any> {
    return this.http.get(`${this.patientUrl}/ehr/${mpid}?role=${role}`);
  }

  // 🔥 LOGIN
  login(username: string, password: string) {
    return this.http.post(`${this.baseUrl}/auth/login`, {
      username,
      password
    });
  }

  // 🔥 DOCTOR APIs
  getDoctorCounts(doctorId: number) {
    return this.http.get(`${this.baseUrl}/doctor/counts/${doctorId}`);
  }

  getDoctorPatients(doctorId: number, type: string) {
    return this.http.get(
      `${this.baseUrl}/doctor/patients?doctorId=${doctorId}&type=${type}`
    );
  }

  // 🔥 STAFF (NEW)
  getStaffById(id: number) {
    return this.http.get(`${this.baseUrl}/staff/${id}`);
  }

  getPatientDetails(mpid: number) {
    return this.http.get(`${this.baseUrl}/doctor/patient/${mpid}`);
  }

  getVitalsByPatient(mpid: number) {
    return this.http.get(`${this.baseUrl}/doctor/vitals/${mpid}`);
  }

  // 🔥 NURSE APIs
  getNursePatients(section: string) {
    return this.http.get(`${this.baseUrl}/nurse/patients?section=${section}`);
  }

  addVitals(data: any) {
    return this.http.post(`${this.baseUrl}/nurse/vitals`, data);
  }

  getAdminStats() {
    return this.http.get(`${this.baseUrl}/admin/stats`);
  }

  getAdminStaff() {
    return this.http.get(`${this.baseUrl}/admin/staff`);
  }

  getAdminPatients() {
    return this.http.get(`${this.baseUrl}/admin/patients`);
  }

  addStaff(data: any) {
    return this.http.post(`${this.baseUrl}/admin/staff`, data);
  }

  deleteStaff(id: number) {
    return this.http.delete(`${this.baseUrl}/admin/staff/${id}`);
  }

  //ADMIN APIS
  getAdminLab() {
    return this.http.get('http://localhost:5000/api/admin/lab');
  }

  getAdminClaims() {
    return this.http.get('http://localhost:5000/api/admin/claims');
  }

  getAdminMeds() {
    return this.http.get('http://localhost:5000/api/admin/meds');
  }

  getPatientDashboard(mpid: number) {
    return this.http.get(`${this.baseUrl}/patient/dashboard/${mpid}`);
  }

  getPatientVitals(mpid: number) {
    return this.http.get(`${this.baseUrl}/patient/vitals/${mpid}`);
  }

  getPatientMeds(mpid: number) {
    return this.http.get(`${this.baseUrl}/patient/meds/${mpid}`);
  }

  getPatientLab(mpid: number) {
    return this.http.get(`${this.baseUrl}/patient/lab/${mpid}`);
  }

  getPatientBilling(mpid: number) {
    return this.http.get(`${this.baseUrl}/patient/billing/${mpid}`);
  }
  

}