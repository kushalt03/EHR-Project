package ehr.com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import ehr.com.entity.Patient;


public interface AdminRepository extends JpaRepository<Patient, Long> {

    // 🔹 Counts
    @Query(value = "SELECT COUNT(*) FROM patient", nativeQuery = true)
    int countPatients();

    @Query(value = "SELECT COUNT(*) FROM staff WHERE role_id = 2", nativeQuery = true)
    int countDoctors();

    @Query(value = "SELECT COUNT(*) FROM staff WHERE role_id = 3", nativeQuery = true)
    int countNurses();

    @Query(value = "SELECT COUNT(*) FROM encounter WHERE encounter_type = :type", nativeQuery = true)
    int countByType(@Param("type") String type);

    // 🔹 Staff List
    @Query(value = """
    SELECT staff_id, first_name, last_name, staff_type
    FROM staff
    """, nativeQuery = true)
    List<Object[]> getAllStaff();

    // 🔹 Patient List
    @Query(value = """
    SELECT mpid, first_name, last_name, gender
    FROM patient
    """, nativeQuery = true)
    List<Object[]> getAllPatients();

    @Modifying
    @Transactional
    @Query(value = "DELETE FROM staff WHERE staff_id = :id", nativeQuery = true)
    void deleteStaff(@Param("id") int id);

    // LAB ORDERS COUNT
    @Query(value = "SELECT COUNT(*) FROM lab_orders", nativeQuery = true)
    int countLabOrders();

    // INSURANCE CLAIMS COUNT
    @Query(value = "SELECT COUNT(*) FROM insurance_claims", nativeQuery = true)
    int countClaims();

    // MEDICATION COUNT
    @Query(value = "SELECT COUNT(*) FROM medications", nativeQuery = true)
    int countMedications();

    // REVENUE (SUM)
    @Query(value = "SELECT COALESCE(SUM(transaction_amount),0) FROM billing_transactions", nativeQuery = true)
    Double getRevenue();

    // LAB ORDERS LIST
    @Query(value = """
    SELECT l.order_id, l.mpid, e.encounter_type, l.test_code, l.status
    FROM lab_orders l
    JOIN encounter e ON l.encounter_id = e.encounter_id
    """, nativeQuery = true)
    List<Object[]> getLabOrders();

    // CLAIM LIST
    @Query(value = """
    SELECT ic.claim_id, ic.mpid, e.encounter_type, ic.claim_status
    FROM insurance_claims ic
    JOIN encounter e ON ic.encounter_id = e.encounter_id
    """, nativeQuery = true)
    List<Object[]> getClaims();

    // MEDICATION LIST
    @Query(value = "SELECT med_name, stock_level FROM medications", nativeQuery = true)
    List<Object[]> getMedList();
    

}