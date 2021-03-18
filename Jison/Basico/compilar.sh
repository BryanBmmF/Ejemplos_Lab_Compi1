#!/bin/bash

echo "Procesando gramática..."

jison basico.jison

echo "Ejecutando analizador..."

node basico.js entrada