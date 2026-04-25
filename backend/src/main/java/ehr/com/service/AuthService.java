package ehr.com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ehr.com.repository.PatientRepository;

@Service
public class AuthService {

    @Autowired
    private PatientRepository repo;

    public Object login(String username, String password) {
        System.out.println("USERNAME: " + username);
        System.out.println("PASSWORD: " + password);
        

        // 🔥 1. TRY STAFF LOGIN
        List<Object[]> staffRes = repo.login(username, password);

        if (!staffRes.isEmpty()) {

            Object[] row = staffRes.get(0);

            Map<String, Object> result = new HashMap<>();

            result.put("id", row[0]);
            result.put("first_name", row[1]);
            result.put("last_name", row[2]);

            int roleId = ((Number) row[3]).intValue();

            if (roleId == 2) result.put("role", "doctor");
            else if (roleId == 3) result.put("role", "nurse");
            else result.put("role", "admin");

            return result;
        }

        // 🔥 2. TRY PATIENT LOGIN
        List<Object[]> patientRes = repo.loginPatient(username, password);

        if (!patientRes.isEmpty()) {

            Object[] row = patientRes.get(0);

            Map<String, Object> result = new HashMap<>();

            result.put("id", row[0]);
            result.put("first_name", row[1]);
            result.put("last_name", row[2]);
            result.put("role", "patient");

            return result;
        }

        // ❌ INVALID
        throw new RuntimeException("Invalid credentials");
    }

    // 🔥 OPTIONAL (keep for navbar if needed later)
    public Map<String, Object> getStaffById(int id) {

        Map<String, Object> res = new HashMap<>();

        res.put("first_name", "Shivay");
        res.put("last_name", "Wadhera");
        res.put("role_name", "Dr.");

        return res;
    }

    
}