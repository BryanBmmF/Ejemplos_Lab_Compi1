import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EjemploCompComponent } from './ejemplo-comp/ejemplo-comp.component';
import { IngresoComponent } from './ingreso/ingreso.component';

const routes: Routes = [
  { path: '', component: IngresoComponent },
  //cualquier otro path inexistente, redireccionar a index va de ultimo siempre
  { path: '**', redirectTo:'', pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
