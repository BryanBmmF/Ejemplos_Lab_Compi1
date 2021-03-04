/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bryan.ejemploresult;

import com.bryan.ejemploresult.analizadores.Lexer;
import com.bryan.ejemploresult.analizadores.Parser;
import java.io.StringReader;

/**
 *
 * @author bryan
 */
public class EjemploResult {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        System.out.println("Ejemplo del Uso de Result en CUP");
        
        String entrada = "(2+3) + (2*5)";
        StringReader reader = new StringReader(entrada);
        
        Lexer lexico = new Lexer(reader);
        Parser parserSuma = new Parser(lexico);
        
        try {
            parserSuma.parse();
        } catch (Exception ex) {
            System.out.println("Error irrecuperable");
        }
        
    }
    
}
