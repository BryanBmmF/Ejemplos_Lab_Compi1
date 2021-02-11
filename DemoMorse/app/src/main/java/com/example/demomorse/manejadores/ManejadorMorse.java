package com.example.demomorse.manejadores;

public class ManejadorMorse {

    private int num;
    private String tipo;

    public ManejadorMorse(){
    }

    public ManejadorMorse(int num, String tipo){
        this.num=num;
        this.tipo =tipo;
    }

    public int getNum(){
        return this.num;
    }
    public String getTipo(){
        return this.tipo;
    }

}
