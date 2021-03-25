import { Component, OnInit } from '@angular/core';
//import {parser} from '../analizador/gramatica';   /// <reference path="gramatica.d.ts" />


//import * as parser from '../analizador/gramatica.js';

@Component({
  selector: 'app-ingreso',
  templateUrl: './ingreso.component.html',
  styleUrls: ['./ingreso.component.css']
})
export class IngresoComponent implements OnInit {

  //variables bindeadas de los imput en la vista ingreso
  expresion: string;

  //variable parser con la ruta del archivo compilado
  //parser = require('../analizador/gramatica.js');
  //parser = ({moduleName: "gramatica"});
  
  arreglo = [];
  contador = 1;
  constructor() { }

  ngOnInit(): void {
    /* para hacer algo al iniciar la pagina */
  }

  //metodo para calcular la expresion

  /* 
  calcular() {
    console.log("la Expresion ingresada es:" + this.expresion);

    //parseamos la entrada
    this.arreglo = this.parser.parse(this.expresion);

    //desplegar resultado
    this.arreglo.forEach(function (exp) {
      console.log('El valor de la expresión ' + this.contador + ' es: ' + exp);
      this.contador++;
    });
  }
  */
  

}
