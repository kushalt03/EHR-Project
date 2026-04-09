package ehr.com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ehr.com.entity.VitalSigns;

@Repository
public interface VitalRepository extends JpaRepository<VitalSigns, Integer> {
}