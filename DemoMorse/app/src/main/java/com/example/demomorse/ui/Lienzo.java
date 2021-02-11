package com.example.demomorse.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.View;

public class Lienzo extends View {
    private Integer numLn;
    private Integer numPs;
    public Lienzo(Context context, Integer numLn, Integer numPs) {
        super(context);
        this.numLn=numLn;
        this.numPs=numPs;
    }

    /*Sobreescritura del metodo onDraw*/
    protected void onDraw(Canvas canvas) {

        /*Fondo del lienzo*/
        canvas.drawRGB(255, 255, 0);

        /*Pintador*/
        Paint pincel1 = new Paint();
        pincel1.setARGB(255, 255, 0, 0);

        int aux= 100;
        if (numLn!=null && numPs!=null){
            //lineas
            for (int i=1; i<=numLn; i++){
                pincel1.setStrokeWidth(15);
                canvas.drawLine(100, i*100, 300, i*100, pincel1);
            }
            //puntos
            for (int i=1; i<=numPs; i++){
                pincel1.setStrokeWidth(20);
                canvas.drawLine(100, 600+aux, 120, 600+aux, pincel1);
                aux=aux+100;
            }
        } else if(numLn!=null){
            //lineas
            for (int i=1; i<=numLn; i++){
                pincel1.setStrokeWidth(15);
                canvas.drawLine(100, i*100, 300, i*100, pincel1);
            }
        } else {
            //puntos
            for (int i=1; i<=numPs; i++){
                pincel1.setStrokeWidth(20);
                canvas.drawLine(100, 600+aux, 120, 600+aux, pincel1);
                aux=aux+100;
            }
        }

    }


}
