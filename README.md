# IMC_Solar2d_MoralesVazquezDiegoAlberto_GonzalesFuentesMelissaDanahe_6B_Programacion
Esta aplicación móvil la cual fue desarrollada con el motor Solar2d, nos permitirá calcular el índice de masa corporal (IMC) de forma fácil y sencilla aplicando la lógica de programación y la lógica matemática.

##Descripción del Proyecto
Esta aplicación móvil, desarrollada con el motor **Solar2D (Lua)**, permite calcular el Índice de Masa Corporal (IMC) de forma rápida y precisa. El propósito es aplicar lógica de programación para la gestión de datos de salud, asegurando que el usuario reciba información veraz mediante un sistema de validaciones robusto.

##Especificaciones Técnicas
- **Lenguaje:** Lua
- **Motor:** Solar2Dd
- **Fórmula utilizada:** `IMC = peso / (altura * altura)`
- **Redondeo:** Aplicado a 1 decimal para mayor claridad.

## Lógica de Validaciones (Punto Crítico)
Para cumplir con los requisitos de calidad, la app bloquea el cálculo en los siguientes escenarios:
1. **Campos Vacíos:** No se procesa información si falta el peso o la altura.
2. **Datos No Numéricos:** Se asegura que el programa no colapse si se ingresan letras.
3. **Valores Irreales:** 
   - **Altura:** Debe estar entre 0.50m y 2.50m.
   - **Peso:** Debe estar entre 10kg y 300kg.
   *Esto evita errores de dedo y asegura que el IMC sea coherente.*

## Clasificación de Resultados
La app categoriza según los estándares de la OMS:
- **< 18.5:** Bajo peso
- **18.5 - 24.9:** Peso Normal
- **25.0 - 29.9:** Sobrepeso
- **> 30.0:** Obesidad

## Capturas de Pantalla
![Interfaz Inicial](link_a_tu_captura1)
![Cálculo Exitoso](link_a_tu_captura2)

## Video Demostrativo
Puedes ver el funcionamiento de la aplicación aquí:  
[Enlace al video en YouTube/Drive]

---
© 2024 - Práctica Escolar IMC
