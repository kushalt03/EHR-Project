package ehr.com.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ehr.com.entity.VitalSigns;
import ehr.com.service.NurseService;

@RestController
@RequestMapping("/api/nurse")
@CrossOrigin(origins = "http://localhost:4200")
public class NurseController {

    @Autowired
    private NurseService nurseService;

    // 🔥 get patients by section
    @GetMapping("/patients")
    public Object getPatients(@RequestParam String section) {
        return nurseService.getPatients(section);
    }

    // 🔥 add vitals
    @PostMapping("/vitals")
    public void addVitals(VitalSigns v) {
        v.setMeasurement_time(LocalDateTime.now());
        // temporary fix (can improve later)
        v.setStaff_id(6); 
        nurseService.addVitals(v);
    }
}