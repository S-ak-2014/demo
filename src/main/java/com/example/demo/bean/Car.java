package com.example.demo.bean;

import org.springframework.context.annotation.ComponentScan;

@ComponentScan
public class Car{

    int id;
    String carMake;
    String carModel;

    public Car() {
        super();
    }
    public Car(int id, String carMake,String carModel) {
        super();
        this.id = id;
        this.carMake = carMake;
        this.carModel=carModel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCarMake() {
        return carMake;
    }

    public void setCarMake(String carMake) {
        this.carMake = carMake;
    }

    public String getCarModel() {
        return carModel;
    }

    public void setCarModel(String carModel) {
        this.carModel = carModel;
    }
}
