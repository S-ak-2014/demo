package com.example.demo.bean;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Car implements Serializable {
    private String carMaker;
    private String carModel;
}
