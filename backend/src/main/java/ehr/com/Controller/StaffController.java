package ehr.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ehr.com.repository.PatientRepository;

@RestController
@RequestMapping("/api/staff")
@CrossOrigin(origins = "http://localhost:4200")
public class StaffController {

    @Autowired
    private PatientRepository repo;

    @GetMapping("/{id}")
    public Object getStaff(@PathVariable int id) {
        return repo.getStaffById(id);
    }
}