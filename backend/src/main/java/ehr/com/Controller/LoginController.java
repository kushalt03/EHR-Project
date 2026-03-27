package ehr.com.controller;

import ehr.com.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:4200")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @PostMapping("/login")
    public Object login(@RequestBody LoginRequest request) {
        return loginService.login(request.getUsername(), request.getPassword());
    }
}