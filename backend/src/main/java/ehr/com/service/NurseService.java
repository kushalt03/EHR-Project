package ehr.com.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ehr.com.entity.VitalSigns;
import ehr.com.repository.PatientRepository;
import ehr.com.repository.VitalRepository;

@Service
public class NurseService {

    @Autowired
    private PatientRepository repo;

    @Autowired
    private VitalRepository vitalRepo;

    // 🔥 filter by section (OPD/IPD/EMERGENCY)
    public Object getPatients(String section) {
        return repo.getPatientsByType(section);
    }

    // 🔥 insert vitals
    public void addVitals(VitalSigns v) {

        System.out.println("🔥 ADD VITALS HIT");

        v.setMeasurement_time(LocalDateTime.now());
        v.setStaff_id(6);
        v.setBlood_pressure("120/80");

        Integer encounterId = repo.getEncounterIdByMpid(v.getMpid());

        System.out.println("MPID: " + v.getMpid());
        System.out.println("Encounter Found: " + encounterId);

        if (encounterId == null) {
            encounterId = repo.getAnyEncounter();
            System.out.println("Fallback used: " + encounterId);
        }

        v.setEncounter_id(encounterId);

        vitalRepo.save(v);
    }
}