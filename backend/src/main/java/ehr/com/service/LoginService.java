package ehr.com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ehr.com.Repository.PatientRepository;

@Service
public class LoginService {

    @Autowired
    private PatientRepository repo;

    public Object login(String username, String password) {

        List<Object[]> result = repo.loginUser(username, password);

        if(result.isEmpty()) {
            return "Invalid credentials";
        }

        Object[] row = result.get(0);

        int staffId = ((Number) row[0]).intValue();
        int roleId = ((Number) row[1]).intValue();

        String role = mapRole(roleId);

        Map<String, Object> response = new HashMap<>();
        response.put("staffId", staffId);
        response.put("role", role);

        return response;
    }

    private String mapRole(int roleId) {
        return switch (roleId) {
            case 2 -> "doctor";
            case 3 -> "nurse";
            case 6 -> "pharmacist";
            case 4 -> "admin";
            case 1 -> "admin";
            default -> "unknown";
        };
    }
}