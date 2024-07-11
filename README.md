## Modelos de Computación

Este repositorio contiene la práctica realizada como parte de la asignatura de **Modelos de Computación** de la **UGR**. El objetivo de esta práctica es procesar un archivo de texto que contiene información de clientes, filtrando y organizando estos datos de manera más ordenada.

## Problema que Soluciona la Práctica

El programa toma un archivo de texto como argumento al ejecutarse. Este archivo contiene información de clientes que ha pasado un filtro inicial y debe tener al menos uno de los siguientes elementos: número de teléfono fijo, número de teléfono móvil o un correo electrónico (solo se admiten dominios @gmail.com, @hotmail.es, @hotmail.com, @correo.ugr.es). Si un cliente tiene tanto un número de teléfono como un correo, estos están seguidos y separados por un “-”.

El programa reconoce estos conjuntos de datos y los guarda en otro archivo, creando una lista resumida que puede utilizarse para generar listas de spam o simplemente para tener los datos más organizados.

## Tecnologías Usadas

- **Lenguaje de Programación:** C++
- **Herramientas:** Lex (Flex)

## Instrucciones de Compilación y Ejecución

1. Compilar el archivo Lex:
   flex Practica1.l
2. Compilar el codigo generado con g++:
3. g++ lex.yy.cc -I {path de la libreria FlexLexer.h} -lfl -o Practica1
