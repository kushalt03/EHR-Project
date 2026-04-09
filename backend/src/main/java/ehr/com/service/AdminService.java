package ehr.com.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ehr.com.repository.AdminRepository;

@Service
public class AdminService {

    @Autowired
    private AdminRepository repo;

    public Map<String, Object> getStats() {

        Map<String, Object> res = new HashMap<>();

        res.put("patients", repo.countPatients());
        res.put("doctors", repo.countDoctors());
        res.put("nurses", repo.countNurses());
        res.put("opd", repo.countByType("OPD"));
        res.put("ipd", repo.countByType("IPD"));
        res.put("emergency", repo.countByType("EMERGENCY"));
        res.put("lab", repo.countLabOrders());
        res.put("claims", repo.countClaims());
        res.put("meds", repo.countMedications());
        res.put("revenue", repo.getRevenue());

        return res;
    }

    public Object getStaff() {
        return repo.getAllStaff();
    }

    public Object getPatients() {
        return repo.getAllPatients();
    }

    public void addStaff(Map<String, Object> body) {
        // skip for now if not needed
    }

    public void deleteStaff(int id) {
        repo.deleteStaff(id);
    }

    public Object getLabOrders() {
        return repo.getLabOrders();
    }

    public Object getClaims() {
        return repo.getClaims();
    }

    public Object getMedications() {
        return repo.getMedList();
    }
}