package ehr.com.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import ehr.com.Model.PatientModel;

@Repository
public interface PatientRepository extends JpaRepository<PatientModel, Integer> {

    // 👨‍⚕️ Doctor View
    @Query(value = """
    SELECT p.first_name, p.last_name, e.encounter_type, d.icd_code,
           cn.note_content, pr.med_code
    FROM patient p
    JOIN encounter e ON p.mpid = e.mpid
    LEFT JOIN diagnoses d ON e.encounter_id = d.encounter_id
    LEFT JOIN clinical_notes cn ON e.encounter_id = cn.encounter_id
    LEFT JOIN prescriptions pr ON e.encounter_id = pr.encounter_id
    WHERE p.mpid = :mpid
    """, nativeQuery = true)
    List<Object[]> getDoctorView(@Param("mpid") Long mpid);


    // 👩‍⚕️ Nurse View
    @Query(value = """
    SELECT p.first_name, p.last_name, v.temperature, v.heart_rate,
           r.room_number
    FROM patient p
    JOIN encounter e ON p.mpid = e.mpid
    LEFT JOIN vital_signs v ON e.encounter_id = v.encounter_id
    LEFT JOIN ipd_admissions ipd ON e.encounter_id = ipd.encounter_id
    LEFT JOIN hospital_rooms r ON ipd.assigned_room_id = r.room_id
    WHERE p.mpid = :mpid
    """, nativeQuery = true)
    List<Object[]> getNurseView(@Param("mpid") Long mpid);


    // 💊 Pharmacist View
    @Query(value = """
    SELECT p.first_name, p.last_name, pr.med_code, m.med_name
    FROM patient p
    JOIN prescriptions pr ON p.mpid = pr.mpid
    JOIN medications m ON pr.med_code = m.med_code
    WHERE p.mpid = :mpid
    """, nativeQuery = true)
    List<Object[]> getPharmaView(@Param("mpid") Long mpid);


    // 🧑‍💼 Admin View
    @Query(value = """
    SELECT p.first_name, p.last_name, e.encounter_type,
           bt.transaction_amount
    FROM patient p
    JOIN encounter e ON p.mpid = e.mpid
    LEFT JOIN billing_transactions bt ON e.encounter_id = bt.encounter_id
    WHERE p.mpid = :mpid
    """, nativeQuery = true)
    List<Object[]> getAdminView(@Param("mpid") Long mpid);

    @Query(value = """
       SELECT staff_id, role_id 
       FROM staff 
       WHERE username = :username AND password_hash = :password
       """, nativeQuery = true)
       List<Object[]> loginUser(@Param("username") String username,
                                @Param("password") String password);
}