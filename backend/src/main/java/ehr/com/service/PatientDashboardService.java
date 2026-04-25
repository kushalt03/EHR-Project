package ehr.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ehr.com.repository.PatientRepository;

@Service
public class PatientDashboardService {

    @Autowired
    private PatientRepository repo;

    public Object getPatientDashboard(int mpid) {
        Object res = repo.getPatientDashboard(mpid);

        if (res == null) {
            throw new RuntimeException("No data found for mpid: " + mpid);
        }

        return res;
    }

    public Object getVitals(int mpid) {
        return repo.getLatestVitals(mpid);
    }

    public Object getMedications(int mpid) {
        return repo.getMedications(mpid);
    }

    public Object getLab(int mpid) {
        return repo.getLab(mpid);
    }

    public Object getBilling(int mpid) {
        return repo.getBilling(mpid);
    }

}