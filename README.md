## Resumen

El término de visualización de datos y visualización de la información (usualmente, *dataviz* e *infovis*) son útiles para referirse a cualquier representación visual de datos que contenga:

- Trazados con la ayuda de métodos computarizados (puede tener toques personalizados); 
- Fácil de regenerar con diferentes datos (la misma forma puede reutilizarse para representar diferentes conjuntos de datos con dimensiones o características similares);
- A menudo estéticamente estéril (los datos no están decorados); y relativamente rico en datos (es viable para grandes volúmenes de datos). 

Las visualizaciones de datos son inicialmente diseñadas por un humano, pero luego se dibujan algorítmicamente con un software de gráficos o diagramas. La ventaja de este enfoque es que es relativamente simple actualizar o regenerar la visualización con más o nuevos datos. Si bien pueden mostrar grandes volúmenes de datos, las visualizaciones de información suelen ser menos estéticamente ricas que las infografías y tiene como objetivo:

- Contar una historia
- Transmitir un mensaje

# Visualización de datos (outlines)

Tipos de datos:

1. Cuantitativos
   - Continuos
   - Discretos
2. Categóricos
3. Ordenados
4. Visual Encoding
   - Planar and Retinal variables
5. Power of visual perception
   1. Attributes from visual perception:
      - Preattentive processing
      - attentive processing
6. Visualización de datos
   - Contar una historia
   - transmitir un mensaje
7. Pre-attentive processing
   - Principios de percepción de gestalt
   - make sense of visual information
     - Proximidad
     - similaridad
     - Figura y fondo/base
     - Continuidad
     - Closure
     - Simplicity

Gestalt principles is about perception and reality 

>  Nuestro cerebro tiende a ver figuras lo más simple posiblepensamiento creativo + principios de gestalt = buen diseño 

8. Gestalt principles → junk (chart) → Data-ink-ratio (lie factor)
   - Equation:
   Size of the effect shown in the graph / Sise of the effect shown in the data = lie factor  

>  Intervals 0.95 < lie factor < 1.05 
>
> The lie-factor is an adimensional **measure of the effectiveness** of the graph, **how plot is presenting data-vis properly**. 

9. Grammar of graphics
10. ggplot2 and r objects

Referencia:
- Steele J., Iliinsky N. (2011), Designing Data Visualizations ; Chapter 1; O'Reilly Media, Inc. ISBN: 9781449314774
- web: www.udacity.com (2018); Data Visualization and d3.js 

# Seccion 1 - Tipo de datos:

Hay tres tipos básicos de datos: algo que puedes cuantificar, algo que puedes ordenar y algo que puedes diferenciar. Estos tipos se reducen a tres términos : 



* *Cuantitativos*: (ie. datos numéricos) - teóricamente con distribución normal -: 

1. Continuos (0.1, 0.3, 0.4 …) ← flotantes,  **Consumo de oxígeno**
2. Discretos (1, 2, 3, 5, etc...) ← enteros, **Serie de tiempo**

* *Cualitativos*: Datos categóricos que pueda ser comparados:

1. *Nominal*: -Algo que se puede diferencia- Son aquellas variables asignadas a categorías sin la necesidad de tener un ordenamiento definido. Si las variables tienen un ordenamiento claro, entonces esa variable sería una variable ordinal:

   * **The blood type of a person: A, B, AB or O.**
   * **Género Masculino y femenino**
   * **El color del cabello de una persona (rubia, morena, etc.)**

2. *Ordinal*: -Algo que se puede ordenar - cualquier dato que pueda ser comparado u ordenado con un ordenamiento definido en las variables:

   * **Estatus económico (bajo, medio, alto)**

   * **Grado académico (bachillerato, Carrera, posgrado, posdoctorado)**

   * > En este ejemplo, podemos ordenar a las personas en el nivel de experiencia educativa, pero el tamaño de la diferencia entre categorías es inconsistente (porque el espaciado entre las categorías uno y dos es más grande que las categorías dos y tres). Si estas categorías estuvieran igualmente espaciadas, entonces la variable sería una variable de intervalo.

3. *Intervalos*: Una variable de intervalo es similar a una variable ordinal, excepto que los intervalos entre los valores de sus variables están equiespaciados.

   * Ingreso anual de tres personas (10K, 15K, 20K dólares).  La segunda persona gana $ 5,000 más que la primera persona y $ 5,000 menos que la tercera persona, y el tamaño de estos intervalos es el mismo

Es importante conocer con qué tipo de datos estamos tratando debido a que los análisis computacionales y estadísticos asumen que las variables tienen un nivel específico de medición. En vista de que se determine el tipo de variable que se tenga será el tipo de análisis que se podrá efectuar. Por ejemplo, no tendría sentido calcular un color de cabello promedio. Un promedio de una variable categórica no tiene mucho sentido porque no hay un orden intrínseco de los niveles de las categorías. 

Referencia de esta sección:

*Reference: Institute for Digital Research and Education: What is the difference between categorical, ordinal and interval variables?; from: https://stats.idre.ucla.edu/other/mult-pkg/whatstat/what-is-the-difference-between-categorical-ordinal-and-interval-variables/ (accesso Mayo 22, 2018)



# Seccion 2: Start coding as the follow chunks  

* [R documentation here](http://rpubs.com/rgomez/433172)
* Slides from the course here:  [docs](https://github.com/RJEGR/July_2018_bioinfo/tree/master/docs)/**Visualización de datos_intro.pdf**



