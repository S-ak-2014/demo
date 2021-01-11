package com.example.demo.controller;

import com.example.demo.bean.Car;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@EnableAutoConfiguration
public class MainController {

    public MainController() {
        initializeCarList();
    }

    final List<Car> carList = new ArrayList<>();

    private List<Car> initializeCarList() {

        carList.add(new Car("Ford", "Mustang"));
        carList.add(new Car("Ford", "Boss 429"));
        carList.add(new Car("Ford", "Charger"));
        carList.add(new Car("Ford", "Challenger"));
        carList.add(new Car("Mahindra", "Thar"));
        carList.add(new Car("Buggati", "Veyron"));

        return carList;

    }

    @RequestMapping(method = RequestMethod.POST)
    public String addCarList(@RequestBody Car newCar, @ModelAttribute ModelMap modelMap) {
        carList.add(newCar);
        modelMap.addAttribute("carList", carList);
        return "/car";
    }

    @RequestMapping(method = RequestMethod.GET)
    public String viewCarList(ModelMap model) {
        model.addAttribute("carList", carList);
        return "/car";
    }

}