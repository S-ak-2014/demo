package com.example.demo.bean;

import lombok.*;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Car implements Serializable {
    private String carMake;
    private String carModel;
}
