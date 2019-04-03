package com.example.demo.controller;

import java.util.List;

public class Test1 {

    public static void main(String[] args){
        UserController controller=new UserController();
        List list=controller.findAll();
        System.out.println(list);
    }
}
