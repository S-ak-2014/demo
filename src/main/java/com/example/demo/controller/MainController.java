package com.example.demo.controller;

import com.example.demo.bean.Car;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    private static List<Car> carList = new ArrayList<>();

    static {
        carList.add(new Car(1,"Honda", "Civic"));
        carList.add(new Car(2,"Buggati", "Veyron"));
        carList.add(new Car(3,"Mahindra", "Thar"));
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String carList(@ModelAttribute ModelMap model) {
        model.addAttribute("carList",carList);
        return "/car";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String add(@ModelAttribute("car") Car car) {
        if(null != car && null != car.getCarMake()
        && null != car.getCarModel() && !car.getCarMake().isEmpty()) {
            synchronized (carList) {
                carList.add(car);
            }
        }
        return "/car";
    }

}