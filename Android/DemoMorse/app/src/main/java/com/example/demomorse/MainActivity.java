package com.example.demomorse;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.demomorse.analizadores.Lexer;
import com.example.demomorse.analizadores.Parser;
import com.example.demomorse.manejadores.ManejadorMorse;
import com.example.demomorse.ui.Resultado;

import java.io.StringReader;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MainActivity extends AppCompatActivity {

    //Miembros para recibir componentes del activity main
    private EditText editEntrada;
    private Button ingresarButton;
    private List<ManejadorMorse> lista;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //recibiendo los componentes del activity main
        editEntrada = findViewById(R.id.editTextEntrada);
        ingresarButton = findViewById(R.id.compilarButton);

        //generando evento del boton
        ingresarButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    /*codigo de compilacion*/
                    String entrada = editEntrada.getText().toString();
                    StringReader reader = new StringReader(entrada);

                    Lexer lexico = new Lexer(reader);
                    Parser parser = new Parser(lexico);
                    //traer una lista de datos y luego mandarlos a la siguiente ventana
                    parser.parse();

                    desplegarResultado(parser.getClavesList());


                } catch (NoSuchAlgorithmException e) { //error en onclick
                    e.printStackTrace();
                } catch (Exception ex) { //error en parser
                    System.out.println("Error irrecuperable");
                    Logger.getLogger(MainActivity.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });

    }

    /*metodo para enviar datos a una nueva actividad y desplegar el resultado*/
    public void desplegarResultado(List<ManejadorMorse> lista){
        Intent nuevaVentanaPrincipal = new Intent(this, Resultado.class);

        Bundle nuevoBundlePrincipal = new Bundle();

        //recoleccion de datos a enviar
        for(ManejadorMorse m: lista){
            nuevoBundlePrincipal.putSerializable(m.getTipo(), m.getNum());
        }
        nuevaVentanaPrincipal.putExtras(nuevoBundlePrincipal); //empaquetado de datos
        startActivity(nuevaVentanaPrincipal); //Start de la nueva actividad
        //finish();  //solo si ya no queremos volver a la actividad anterior
    }
}
