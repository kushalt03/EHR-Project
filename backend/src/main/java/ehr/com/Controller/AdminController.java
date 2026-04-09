package ehr.com.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ehr.com.service.AdminService;

@RestController
@RequestMapping("/api/admin")
@CrossOrigin(origins = "http://localhost:4200")
public class AdminController {

    @Autowired
    private AdminService adminService;


    @GetMapping("/stats")
    public Map<String, Object> getStats() {
        return adminService.getStats();
    }

    @GetMapping("/staff")
    public Object getStaff() {
        return adminService.getStaff();
    }

    @GetMapping("/patients")
    public Object getPatients() {
        return adminService.getPatients();
    }

    @PostMapping("/staff")
    public void addStaff(@RequestBody Map<String, Object> body) {
        adminService.addStaff(body);
    }

    @DeleteMapping("/staff/{id}")
    public void deleteStaff(@PathVariable int id) {
        adminService.deleteStaff(id);
    }

    @GetMapping("/lab")
    public Object getLab() {
        return adminService.getLabOrders();
    }

    @GetMapping("/claims")
    public Object getClaims() {
        return adminService.getClaims();
    }

    @GetMapping("/meds")
    public Object getMeds() {
        return adminService.getMedications();
    }
}