package ehr.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ehr.com.repository.PatientRepository;
import ehr.com.service.DoctorService;

@RestController
@RequestMapping("/api/doctor")
@CrossOrigin(origins = "http://localhost:4200")
public class DoctorController {

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private PatientRepository patientRepository;

    @GetMapping("/counts/{doctorId}")
    public Object getCounts(@PathVariable int doctorId) {
        return doctorService.getPatientCounts(doctorId);
    }

    @GetMapping("/patients")
    public List<Object[]> getPatients(
        @RequestParam int doctorId,
        @RequestParam String type
    ) {
        return doctorService.getPatients(doctorId, type);
    }

    @GetMapping("/patient/{mpid}")
    public Object getPatientDetails(@PathVariable int mpid) {
        return doctorService.getPatientFullDetails(mpid);
    }

    @GetMapping("/vitals/{mpid}")
    public List<?> getVitals(@PathVariable int mpid){
        return patientRepository.getVitalsByMpid(mpid);
    }
}