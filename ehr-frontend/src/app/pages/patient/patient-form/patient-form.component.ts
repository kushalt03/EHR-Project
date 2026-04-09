import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { WebClientService } from '../../../core/services/web-client.service'; 

@Component({
  selector: 'app-patient-form',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './patient-form.component.html',   
  styleUrls: ['./patient-form.component.scss']    
})
export class PatientFormComponent {

  patientForm: FormGroup;
  responseMessage: string = '';

  genders = ['Male', 'Female', 'Other', 'Unknown'];

  constructor(private fb: FormBuilder, private webClient: WebClientService) {
    this.patientForm = this.fb.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      dob: ['', Validators.required],
      gender: ['', Validators.required],
      contactNo: [''],
      email: [''],
      nationalId: [''],
      primaryAddress: [''],
      insurancePolicyNo: [''],
      pcpDoctorId: ['']
    });
  }

  onSubmit() {
    if (this.patientForm.valid) {
      this.webClient.submitPatient(this.patientForm.value).subscribe({
        next: () => this.responseMessage = 'Patient saved successfully!',
        error: () => this.responseMessage = 'Error saving patient.'
      });
    }
  }
}