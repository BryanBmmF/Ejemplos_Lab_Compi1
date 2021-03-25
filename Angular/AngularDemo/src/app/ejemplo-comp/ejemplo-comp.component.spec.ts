import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EjemploCompComponent } from './ejemplo-comp.component';

describe('EjemploCompComponent', () => {
  let component: EjemploCompComponent;
  let fixture: ComponentFixture<EjemploCompComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EjemploCompComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EjemploCompComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
