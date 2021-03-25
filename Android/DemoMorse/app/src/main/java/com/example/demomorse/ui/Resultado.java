package com.example.demomorse.ui;

import android.os.Bundle;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.example.demomorse.R;
import java.security.NoSuchAlgorithmException;


public class Resultado extends AppCompatActivity{

    private Integer dato1; //Numero de lineas
    private Integer dato2; //Numero de puntos

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_resultado);

        //Recibimos los datos de la ventana o actividad anterior
        try {
            recibirDatos();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        //Obtenemos el layout del activity y lo pasamos como contexto a un nuevo lienzo que nos permitira hacer trazos
        ConstraintLayout layout1 = (ConstraintLayout) findViewById(R.id.textResultado);
        Lienzo fondo = new Lienzo(this, dato1,dato2);
        layout1.addView(fondo);

    }

    //METODO PARA RECIBIR DATOS DE LA VENTANA ANTERIOR
    private void recibirDatos() throws NoSuchAlgorithmException {
        Bundle datos = getIntent().getExtras();
        if (datos != null) {
            dato1 = (Integer) datos.getSerializable("ln");
            dato2 = (Integer) datos.getSerializable("ps");
        }

    }



}
