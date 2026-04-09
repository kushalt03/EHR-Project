import { Routes } from '@angular/router';

export const routes: Routes = [

  {
    path: '',
    loadComponent: () =>
      import('./auth/login/login.component').then(m => m.LoginComponent)
  },

  {
    path: 'login',
    loadComponent: () =>
      import('./auth/login/login.component').then(m => m.LoginComponent)
  },

  {
    path: 'doctor',
    loadComponent: () =>
      import('./pages/doctor/doctor-dashboard.component').then(m => m.DoctorDashboardComponent)
  },

  // 🔥 ADD THIS
  {
    path: 'nurse',
    loadComponent: () =>
      import('./pages/nurse/nurse-dashboard.component').then(m => m.NurseDashboardComponent)
  },

  // (optional future)
  {
    path: 'admin',
    loadComponent: () =>
      import('./pages/admin/admin-dashboard.component').then(m => m.AdminDashboardComponent)
  },

  {
    path: 'patient',
    loadComponent: () =>
      import('./pages/patient/patient-dashboard.component').then(m => m.PatientDashboardComponent)
  }

];