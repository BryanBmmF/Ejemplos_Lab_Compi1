import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { IngresoComponent } from './ingreso/ingreso.component';
import { FormsModule } from '@angular/forms';
import { EjemploCompComponent } from './ejemplo-comp/ejemplo-comp.component';
//import {Parser} from './analizador/gramatica.js'; 

@NgModule({
  declarations: [
    AppComponent,
    IngresoComponent,
    EjemploCompComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule
    
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
