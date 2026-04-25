package ehr.com.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "Only the EHR Backend is Running - No Frontend!!! CRAZY!!!";
    }
}
