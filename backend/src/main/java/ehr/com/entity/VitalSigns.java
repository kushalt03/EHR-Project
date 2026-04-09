package ehr.com.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "vital_signs")
public class VitalSigns {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int vitals_id;

    private int encounter_id;
    private int mpid;
    private int staff_id;

    private LocalDateTime measurement_time;

    private Double temperature;
    private Integer heart_rate;
    private String blood_pressure;

    private Double spo2;
    private Integer pain_score;
    private Integer gcs_score;

    // ===== GETTERS & SETTERS =====

    public int getVitals_id() { return vitals_id; }
    public void setVitals_id(int vitals_id) { this.vitals_id = vitals_id; }

    public int getEncounter_id() { return encounter_id; }
    public void setEncounter_id(int encounter_id) { this.encounter_id = encounter_id; }

    public int getMpid() { return mpid; }
    public void setMpid(int mpid) { this.mpid = mpid; }

    public int getStaff_id() { return staff_id; }
    public void setStaff_id(int staff_id) { this.staff_id = staff_id; }

    public LocalDateTime getMeasurement_time() { return measurement_time; }
    public void setMeasurement_time(LocalDateTime measurement_time) { this.measurement_time = measurement_time; }

    public Double getTemperature() { return temperature; }
    public void setTemperature(Double temperature) { this.temperature = temperature; }

    public Integer getHeart_rate() { return heart_rate; }
    public void setHeart_rate(Integer heart_rate) { this.heart_rate = heart_rate; }

    public String getBlood_pressure() { return blood_pressure; }
    public void setBlood_pressure(String blood_pressure) { this.blood_pressure = blood_pressure; }

    public Double getSpo2() { return spo2; }
    public void setSpo2(Double spo2) { this.spo2 = spo2; }

    public Integer getPain_score() { return pain_score; }
    public void setPain_score(Integer pain_score) { this.pain_score = pain_score; }

    public Integer getGcs_score() { return gcs_score; }
    public void setGcs_score(Integer gcs_score) { this.gcs_score = gcs_score; }
}