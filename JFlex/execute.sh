#! /bin/bash 
echo "STARTING JFLEX COMPILING"
java -jar ../Lib/jflex-full-1.8.2.jar binarios.jflex
javac Lexer.java
java Lexer entrada.txt