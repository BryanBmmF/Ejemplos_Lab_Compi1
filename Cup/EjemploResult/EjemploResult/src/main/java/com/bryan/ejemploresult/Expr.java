/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bryan.ejemploresult;

/**
 *
 * @author bryan
 */
public class Expr {
    
    private String acarreo;
    private int resultado;

    public Expr(String acarreo, int resultado) {
        this.acarreo = acarreo;
        this.resultado = resultado;
    }

    public String getAcarreo() {
        return acarreo;
    }

    public void setAcarreo(String acarreo) {
        this.acarreo = acarreo;
    }

    public int getResultado() {
        return resultado;
    }

    public void setResultado(int resultado) {
        this.resultado = resultado;
    }
    
    
    
}
