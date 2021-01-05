package com.example.demo.controller;

import com.example.demo.bean.Car;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    // Look-up why the data is getting added on every refresh from the end, the site should load the given data only once
    List<Car> carList = new ArrayList<>();

    public List<Car> getList() {

        carList.add(new Car("Ford", "Mustang"));
        carList.add(new Car("Ford", "Boss 429"));
        carList.add(new Car("Ford", "Charger"));
        carList.add(new Car("Ford", "Challenger"));
        carList.add(new Car("Mahindra", "Thar"));
        carList.add(new Car("Buggati", "Veyron"));

        return carList;

    }

    @RequestMapping(method = RequestMethod.GET)
    public String viewCarList(ModelMap model) {
        model.addAttribute("carList",getList());
        return "/car";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String addCarList(ModelMap model) {
        model.addAttribute("carList",getList());
        return "/car";
    }

}