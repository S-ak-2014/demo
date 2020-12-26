package com.example.demo.controller;

import com.example.demo.model.carList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    @RequestMapping(value = "/car", method = RequestMethod.GET)
    public String init(@ModelAttribute carList carlist) {
        carlist.getMake();
        carlist.getModel();
        return "index";
    }

}
