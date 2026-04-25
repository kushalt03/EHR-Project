package ehr.com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ehr.com.entity.Patient;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Integer> {

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

       @Query(value = """
       SELECT staff_id, first_name, last_name, role_id
       FROM staff
       WHERE staff_id = :id
       """, nativeQuery = true)
       List<Object[]> getStaffById(@Param("id") int id);

      @Query(value = """
       SELECT 
       p.mpid,
       p.first_name,
       p.last_name,
       p.dob,
       p.gender,
       COALESCE(cn.note_content, 'N/A') AS clinical_note
       FROM patient p
       JOIN encounter e ON p.mpid = e.mpid
       LEFT JOIN clinical_notes cn ON e.encounter_id = cn.encounter_id
       WHERE e.encounter_type = :type
       """, nativeQuery = true)
       List<Object[]> getPatientsByType(@Param("type") String type);

       @Query(value = """
       SELECT encounter_id 
       FROM encounter 
       WHERE mpid = :mpid 
       ORDER BY encounter_id DESC 
       LIMIT 1
       """, nativeQuery = true)
       Integer getEncounterIdByMpid(@Param("mpid") int mpid);


       @Query(value = "SELECT encounter_id FROM encounter LIMIT 1", nativeQuery = true)
       Integer getAnyEncounter();


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

//Patient 
       @Query(value = """
       SELECT mpid, first_name, last_name, 5
       FROM patient 
       WHERE LOWER(TRIM(username)) = LOWER(TRIM(:username)) 
       AND TRIM(password_hash) = TRIM(:password)
       """, nativeQuery = true)
       List<Object[]> loginPatient(@Param("username") String username,
                                   @Param("password") String password);

       @Query(value = """
       SELECT staff_id, first_name, last_name, role_id
       FROM staff
       WHERE LOWER(TRIM(username)) = LOWER(TRIM(:username)) 
       AND TRIM(password_hash) = TRIM(:password)
       """, nativeQuery = true)
       List<Object[]> login(@Param("username") String username,
                            @Param("password") String password);

       
       @Query(value = """
       SELECT encounter_type, COUNT(*) 
       FROM encounter
       WHERE attending_doctor_id = :doctorId
       GROUP BY encounter_type
       """, nativeQuery = true)
       List<Object[]> getDoctorCounts(@Param("doctorId") int doctorId);  
       
       @Query(value = """
       SELECT p.mpid, p.first_name, p.last_name, p.dob, p.gender, p.contact_no
       
       FROM patient p
       JOIN encounter e ON p.mpid = e.mpid
       WHERE e.attending_doctor_id = :doctorId
       AND UPPER(TRIM(e.encounter_type)) = UPPER(TRIM(:type))
       """, nativeQuery = true)
       List<Object[]> getDoctorPatients(@Param("doctorId") int doctorId,
                                   @Param("type") String type);

       @Query(value = """
       SELECT p.mpid, p.first_name, p.last_name, v.temperature, r.room_number
       FROM patient p
       JOIN encounter e ON p.mpid = e.mpid
       LEFT JOIN vital_signs v ON e.encounter_id = v.encounter_id
       LEFT JOIN ipd_admissions ipd ON e.encounter_id = ipd.encounter_id
       LEFT JOIN hospital_rooms r ON ipd.assigned_room_id = r.room_id
       """, nativeQuery = true)
       List<Object[]> getNursePatients();


       @Query(value = """
       SELECT p.mpid, r.room_number, m.med_name
       FROM prescriptions pr
       JOIN patient p ON pr.mpid = p.mpid
       JOIN medications m ON pr.med_code = m.med_code
       LEFT JOIN encounter e ON p.mpid = e.mpid
       LEFT JOIN ipd_admissions ipd ON e.encounter_id = ipd.encounter_id
       LEFT JOIN hospital_rooms r ON ipd.assigned_room_id = r.room_id
       """, nativeQuery = true)
       List<Object[]> getPharmaOrders();

       @Query(value = """
       SELECT 
       p.mpid, p.first_name, p.last_name, p.gender, p.dob, p.contact_no
       FROM patient p
       WHERE p.mpid = :mpid
       """, nativeQuery = true)
       Object getPatientDashboard(@Param("mpid") int mpid);

       @Query(value = """
       SELECT temperature, heart_rate, spo2
       FROM vital_signs
       WHERE mpid = :mpid
       ORDER BY measurement_time DESC
       LIMIT 1
       """, nativeQuery = true)
       Object getLatestVitals(@Param("mpid") int mpid);

       @Query(value = """
       SELECT 'Paracetamol 500mg', 800
       """, nativeQuery = true)
       Object getMedications(@Param("mpid") int mpid);

       @Query(value = """
       SELECT 'Blood Test', 'Completed'
       """, nativeQuery = true)
       Object getLab(@Param("mpid") int mpid);

       @Query(value = """
       SELECT transaction_amount, is_paid
       FROM billing_transactions
       WHERE mpid = :mpid
       LIMIT 1
       """, nativeQuery = true)
       Object getBilling(@Param("mpid") int mpid);

       @Query(value = """
       SELECT 
       p.mpid, p.first_name, p.last_name, p.gender, p.contact_no,
       v.temperature, v.heart_rate, v.spo2, m.med_name, m.unit_cost,
       l.test_code, l.status, b.transaction_amount, b.is_paid
       FROM patient p
       LEFT JOIN vital_signs v ON p.mpid = v.mpid
       LEFT JOIN medications m ON p.mpid = m.med_code
       LEFT JOIN lab_order l ON p.mpid = l.mpid
       LEFT JOIN billing_transactions b ON p.mpid = b.mpid
       WHERE p.mpid = :mpid
       LIMIT 1
       """, nativeQuery = true)
       Object getFullPatientDashboard(@Param("mpid") int mpid);

       @Query(value = """
       SELECT 
              (SELECT COUNT(*) FROM patient) AS total_patients,
              (SELECT COUNT(*) FROM staff) AS total_staff,
              (SELECT COUNT(*) FROM encounter) AS total_encounters,
              (SELECT COUNT(*) FROM billing_transactions) AS total_transactions
       """, nativeQuery = true)
       List<Object[]> getAdminOverview();

       // @Query(value = """
       // SELECT 
       // p.first_name, p.last_name, p.dob, p.gender, p.contact_no,

       // im.description,
       // CONCAT(m.med_name, ' (', pr.dosage, ')') AS medication,
       // v.temperature,
       // v.heart_rate,
       // v.blood_pressure
       
       // FROM patient p

       // LEFT JOIN encounter e ON p.mpid = e.mpid
       // LEFT JOIN diagnoses d ON e.encounter_id = d.encounter_id
       // LEFT JOIN icd_master im ON d.icd_code = im.icd_code
       // LEFT JOIN prescriptions pr ON e.encounter_id = pr.encounter_id
       // LEFT JOIN medicine m ON pr.med_code = m.med_code
       // LEFT JOIN vital_signs v ON e.encounter_id = v.encounter_id

       // WHERE p.mpid = :mpid
       // LIMIT 1
       // """, nativeQuery = true)
       // List<Object[]> getPatientFullDetails(@Param("mpid") int mpid);

       @Query(value = """
SELECT 
p.first_name,
p.last_name,
p.dob,
p.gender,
p.contact_no,

im.description,

CONCAT(m.med_name, ' - Dose to give:', pr.dosage) AS medication,

v.temperature,
v.heart_rate,
v.blood_pressure

FROM patient p

LEFT JOIN encounter e ON p.mpid = e.mpid
LEFT JOIN diagnoses d ON e.encounter_id = d.encounter_id
LEFT JOIN icd_master im ON d.icd_code = im.icd_code

LEFT JOIN prescriptions pr ON e.encounter_id = pr.encounter_id

-- ✅ FIXED TABLE NAME HERE
LEFT JOIN medications m ON pr.med_code = m.med_code

LEFT JOIN vital_signs v ON e.encounter_id = v.encounter_id

WHERE p.mpid = :mpid
ORDER BY v.measurement_time DESC
LIMIT 1
""", nativeQuery = true)
List<Object[]> getPatientFullDetails(@Param("mpid") int mpid);


       
       @Query(value = """
       SELECT measurement_time, temperature, heart_rate, spo2, pain_score, gcs_score 
       FROM vital_signs 
       WHERE mpid = :mpid 
       ORDER BY measurement_time
       """, nativeQuery = true)
       List<Object[]> getVitalsByMpid(@Param("mpid") int mpid);

       //ADMIN FULL POWER VIEW
       // Total patients count
       @Query(value = "SELECT COUNT(*) FROM patient", nativeQuery = true)
       int countPatients();

       // Doctors count (role_id = 2)
       @Query(value = "SELECT COUNT(*) FROM staff WHERE role_id = 2", nativeQuery = true)
       int countDoctors();

       // Nurses count (role_id = 3)
       @Query(value = "SELECT COUNT(*) FROM staff WHERE role_id = 3", nativeQuery = true)
       int countNurses();

       @Query(value = "SELECT COUNT(*) FROM encounter WHERE encounter_type = :type", nativeQuery = true)
       int countByType(@Param("type") String type);

       // STAFF LIST
       @Query(value = """
       SELECT staff_id, first_name, last_name, staff_type
       FROM staff
       """, nativeQuery = true)
       List<Object[]> getAllStaff();

       // PATIENT LIST
       @Query(value = """
       SELECT mpid, first_name,last_name, gender
       FROM patient
       """, nativeQuery = true)
       List<Object[]> getAllPatients();

       // INSERT STAFF
       @Modifying
       @Transactional
       @Query(value = """
       INSERT INTO staff (first_name, last_name, staff_type, username, password_hash, role_id, dept_id)
       VALUES (:fn, :ln, :type, :uname, :pass, :role, :dept)
       """, nativeQuery = true)
       void insertStaff(String fn, String ln, String type, String uname, String pass, int role, int dept);

       // DELETE STAFF
       @Modifying
       @Transactional
       @Query(value = "DELETE FROM staff WHERE staff_id = :id", nativeQuery = true)
       void deleteStaff(@Param("id") int id);
}