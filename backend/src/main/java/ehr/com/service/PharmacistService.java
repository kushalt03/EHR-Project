package ehr.com.service;

import ehr.com.repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PharmacistService {

    @Autowired
    private PatientRepository repo;

    public Object getOrders() {
        return repo.getPharmaOrders();
    }
}