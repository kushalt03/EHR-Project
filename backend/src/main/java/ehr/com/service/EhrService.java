package ehr.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ehr.com.repository.PatientRepository;

@Service
public class EhrService {

    @Autowired
    private PatientRepository repo;

    public Object getPatientData(Long mpid, String role) {

        if(role == null) {
            return "Role is required";
        }

        return switch (role.toLowerCase()) {
            case "doctor" -> repo.getDoctorView(mpid);
            case "nurse" -> repo.getNurseView(mpid);
            case "pharmacist" -> repo.getPharmaView(mpid);
            case "admin" -> repo.getAdminView(mpid);
            default -> "Invalid role";
        };
    }
}