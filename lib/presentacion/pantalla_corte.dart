import 'package:flutter/material.dart';

import '../datos/repositorio_ventas.dart';
import '../dominio/dinero.dart';
import '../dominio/venta.dart';

typedef _Datos = (ResumenDia, List<Map<String, Object?>>);

class PantallaCorte extends StatelessWidget {
  final RepositorioVentas ventas;
  const PantallaCorte({super.key, required this.ventas});

  Future<_Datos> _cargar() async {
    final resumen = await ventas.corteDelDia(DateTime.now());
    final top = await ventas.masVendidos();
    return (resumen, top);
  }

  @override
  Widget build(BuildContext context) {
    final estilo = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Corte del día')),
      body: FutureBuilder<_Datos>(
        future: _cargar(),
        builder: (context, snap) {
          if (snap.hasError) return Center(child: Text('${snap.error}'));
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final (resumen, top) = snap.data!;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Ventas: ${resumen.numeroVentas}', style: estilo.titleLarge),
              Text('Total: ${formatearPesos(resumen.totalCentavos)}',
                  style: estilo.headlineSmall),
              Text('IVA incluido: ${formatearPesos(resumen.ivaCentavos)}'),
              const Divider(height: 32),
              Text('Más vendidos', style: estilo.titleMedium),
              if (top.isEmpty) const Text('Aún no hay ventas.'),
              for (final f in top)
                ListTile(
                  title: Text(f['nombre'] as String),
                  trailing: Text('${f['unidades']} uds'),
                ),
            ],
          );
        },
      ),
    );
  }
}