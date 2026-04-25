package ehr.com.controller;

import ehr.com.service.PharmacistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/pharmacist")
public class PharmacistController {

    @Autowired
    private PharmacistService service;

    @GetMapping("/orders")
    public Object getOrders() {
        return service.getOrders();
    }
}