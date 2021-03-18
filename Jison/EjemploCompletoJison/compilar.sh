#!/bin/bash

echo "Procesando gramática..."

jison gramatica.jison

echo "Ejecutando analizador..."

node gramatica.js testcalc