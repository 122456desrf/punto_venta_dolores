# punto_venta_dolores

App de punto de venta hecha con **Flutter** y **SQLite local** (funciona sin internet), desarrollada con **TDD**. Calcula totales, IVA y cambio sin errores, descuenta el inventario automáticamente y hace el corte del día.

Materia: Desarrollo de Aplicaciones Móviles

## Capturas
Instalación de dependencias <img src="capturas/Instalacion-dependencias.jpg"> 
Ronda 1 - Prueba1_Roja <img src="capturas/R1-Prueba1_PruebaRoja_FormatearPesos.jpg" width="250">
Ronda 1 - Prueba1_Verde <img src="capturas/R1-Prueba1_PruebaVerde_FormatearPesos.jpg" width="250">
Ronda 1 - Prueba2_Roja <img src="capturas/R1-Prueba2_PruebaRoja_TextoCentavos.jpg" width="250">
Ronda 1 - Prueba2_Verde <img src="capturas/R1-Prueba2_PruebaVerde_TextoCentavos.jpg" width="250">
Ronda 2 - El Producto <img src="capturas/R2-ElProducto.jpg" width="250">
Ronda 3 - 3.1 Sumar Cantidades <img src="capturas/R3-3.1SumarCantidades.jpg" width="250">
Ronda 3 - 3.2_No Vender Lo Que No Hay <img src="capturas/R3-3.2_NoVenderLoQueNoHay.jpg" width="250">
Ronda 3 - 3.3_IVA Incluido Con Enteros <img src="capturas/R3_3.3_IVA_IncluidoConEnteros.jpg" width="250">
Ronda 3 - 3.4_Cambio, Pago corto y Carrito vacio <img src="capturas/R3-3.4_CambioPagoCarritoVacio.jpg" width="250">
Ronda 3 - 3.5_Las Clases de Venta <img src="capturas/R3-3.5_ClasesVenta.jpg" width="250">
Ronda 4 - Base de Datos Local (SQLite) <img src="capturas/R4-BaseDatosLocal.jpg" width="250">
Ronda 5 - Cobrar Transaccion- 5.1 Cobrar Descuento Inventario <img src="capturas/R5-5.1_DescuentoInventario.jpg" width="250">
Ronda 5 - Cobrar Transaccion- 5.2 Demostración de la transacción y 5.3 Corte del dia <img src="capturas/R5-5.2,5.3_PruebaTransaccion_CorteDia.jpg" width="250">
Ronda 6 - ViewModel y Pantalla <img src="capturas/R6-ViewModel.jpg" width="250">

PANTALLAS: 
Pantalla de Caja <img src="capturas/caja.png" width="250"> 
Pantalla de Carrito <img src="capturas/carrito_productos.png" width="250"> 
Pantalla de Cobros <img src="capturas/cobro_producto.png" width="250"> 
Pantalla de Corte del Dia <img src="capturas/corte_dia.png" width="250">

## Funciones
- Catálogo de productos con búsqueda
- Carrito con IVA incluido (16%) desglosado
- Cobro con cálculo de cambio
- Descuento automático de inventario con transacción (todo o nada)
- Corte del día: ventas, total, IVA y productos más vendidos

## Arquitectura
```
lib/
  dominio/        reglas del negocio (Dart puro): dinero, producto, carrito, venta
  datos/          SQLite: base de datos y repositorios
  presentacion/   ViewModel y pantallas
  main.dart       aquí se conecta todo
test/
  dominio_test.dart
  datos_test.dart
```

## Decisiones técnicas

- **El dinero se guarda en centavos enteros**, nunca en `double`, para evitar errores de redondeo.
- **Cobrar usa una transacción**: si algo falla, no se guarda la venta ni se descuenta inventario.
- **Pruebas de datos con SQLite en memoria**, sin emulador.

## Cómo ejecutarlo

```
flutter pub get
flutter test
flutter run
```

Se necesita un teléfono Android con depuración USB o un emulador. En web no funciona porque `sqflite` no la soporta.

## Pruebas
18 pruebas automáticas (dominio y datos), escritas primero en rojo con TDD.
