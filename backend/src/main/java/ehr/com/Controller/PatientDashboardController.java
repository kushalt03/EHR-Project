package ehr.com.controller;

import ehr.com.service.PatientDashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/patient")
public class PatientDashboardController {

    @Autowired
    private PatientDashboardService service;

    @GetMapping("/dashboard/{mpid}")
    public Object getDashboard(@PathVariable int mpid) {
        return service.getPatientDashboard(mpid);
    }

    @GetMapping("/vitals/{mpid}")
    public Object getVitals(@PathVariable int mpid) {
        return service.getVitals(mpid);
    }

    @GetMapping("/meds/{mpid}")
    public Object getMeds(@PathVariable int mpid) {
        return service.getMedications(mpid);
    }

    @GetMapping("/lab/{mpid}")
    public Object getLab(@PathVariable int mpid) {
        return service.getLab(mpid);
    }

    @GetMapping("/billing/{mpid}")
    public Object getBilling(@PathVariable int mpid) {
        return service.getBilling(mpid);
    }
}