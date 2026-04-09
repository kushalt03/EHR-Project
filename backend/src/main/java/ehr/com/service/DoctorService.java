package ehr.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ehr.com.repository.PatientRepository;

@Service
public class DoctorService {

    @Autowired
    private PatientRepository repo;

    // 🔹 Doctor counts (cards)
    public List<Object[]> getPatientCounts(int doctorId) {
        return repo.getDoctorCounts(doctorId);
    }

    // 🔹 Patients list (dashboard table)
    public List<Object[]> getPatients(int doctorId, String type) {
        return repo.getDoctorPatients(doctorId, type);
    }

    public Object getPatientFullDetails(int mpid) {
        return repo.getPatientFullDetails(mpid);
    }
}