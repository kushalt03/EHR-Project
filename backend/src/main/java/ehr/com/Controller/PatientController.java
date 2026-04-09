package ehr.com.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ehr.com.entity.Patient;
import ehr.com.repository.PatientRepository;
import ehr.com.service.EhrService;

@RestController
@RequestMapping("/api/patients")
@CrossOrigin(origins = "http://localhost:4200")
public class PatientController {

    private final PatientRepository patientRepository;

    @Autowired
    private EhrService ehrService;

    @Autowired
    public PatientController(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }

    // =========================
    // EXISTING CRUD APIs
    // =========================

    // CREATE / SUBMIT
    @PostMapping("/submit")
    public Patient submitPatient(@RequestBody Patient patient) {
        patient.setCreationTimestamp(LocalDateTime.now());
        patient.setLastUpdated(LocalDateTime.now());
        return patientRepository.save(patient);
    }

    // READ ALL
    @GetMapping
    public List<Patient> getAllPatients() {
        return patientRepository.findAll();
    }

    // READ ONE
    @GetMapping("/{id}")
    public Optional<Patient> getPatientById(@PathVariable Integer id) {
        return patientRepository.findById(id);
    }

    // UPDATE
    @PutMapping("/{id}")
    public Patient updatePatient(@PathVariable Integer id, @RequestBody Patient updatedPatient) {
        return patientRepository.findById(id).map(existing -> {
            existing.setFirstName(updatedPatient.getFirstName());
            existing.setLastName(updatedPatient.getLastName());
            existing.setDob(updatedPatient.getDob());
            existing.setGender(updatedPatient.getGender());
            existing.setContactNo(updatedPatient.getContactNo());
            existing.setEmail(updatedPatient.getEmail());
            existing.setNationalId(updatedPatient.getNationalId());
            existing.setPrimaryAddress(updatedPatient.getPrimaryAddress());
            existing.setInsurancePolicyNo(updatedPatient.getInsurancePolicyNo());
            existing.setPcpDoctorId(updatedPatient.getPcpDoctorId());
            existing.setLastUpdated(LocalDateTime.now());
            return patientRepository.save(existing);
        }).orElseThrow(() -> new RuntimeException("Patient not found with id " + id));
    }

    // DELETE
    @DeleteMapping("/{id}")
    public String deletePatient(@PathVariable Integer id) {
        if (patientRepository.existsById(id)) {
            patientRepository.deleteById(id);
            return "Patient deleted successfully";
        } else {
            return "Patient not found";
        }
    }

    // =========================
    // 🔥 NEW EHR ROLE-BASED API
    // =========================

    @GetMapping("/ehr/{mpid}")
    public ResponseEntity<?> getPatientEhrData(
            @PathVariable Long mpid,
            @RequestParam String role) {

        return ResponseEntity.ok(ehrService.getPatientData(mpid, role));
    }
}