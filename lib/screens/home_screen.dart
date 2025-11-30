import 'package:flutter/material.dart';
import '../widgets/kfc_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> _menu = const [
    {
      'id': 0,
      'name': 'Combo Pollo Clásico',
      'price': 5.99,
      'desc': 'Pollo frito, papas y bebida'
    },
    {
      'id': 1,
      'name': 'Alitas BBQ',
      'price': 6.49,
      'desc': '8 alitas con salsa BBQ'
    },
    {
      'id': 2,
      'name': 'Hamburguesa Especial',
      'price': 4.99,
      'desc': 'Carne, queso y salsa especial'
    },
    {
      'id': 3,
      'name': 'Papas Grandes',
      'price': 2.49,
      'desc': 'Porción grande de papas fritas'
    },
    {
      'id': 4,
      'name': 'Wrap de Pollo',
      'price': 3.99,
      'desc': 'Wrap con vegetales y pollo crujiente'
    },
    {
      'id': 5,
      'name': 'Postre de Chocolate',
      'price': 1.99,
      'desc': 'Brownie con salsa de chocolate'
    },
    {
      'id': 6,
      'name': 'Ensalada Fresca',
      'price': 3.49,
      'desc': 'Mix de hojas con aderezo'
    },
    {
      'id': 7,
      'name': 'Combo Familiar',
      'price': 12.99,
      'desc': '4 porciones + 2 bebidas'
    },
  ];

  @override
  Widget build(BuildContext context) {
    // WIDGET 1: Scaffold
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      // WIDGET 2: AppBar
      appBar: AppBar(
        title: const Text('KFC - Menú'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.red.shade800,
      ),
      // WIDGET 3: Drawer
      drawer: Drawer(
        // WIDGET 10: ListView
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red.shade100),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('KFC',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.red.shade800,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Inicio'),
                onTap: () => Navigator.pop(context)),
            ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Acerca de'),
                onTap: () => Navigator.pop(context)),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Cerrar'),
                onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
      // WIDGET 8: Padding / Center / Align
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        // WIDGET 4: Column / Row
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // WIDGET 7: Container
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Ofertas del día',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.red.shade800,
                          fontWeight: FontWeight.w700)),
                ),
              ),
            ),
            // WIDGET 9: SizedBox
            const SizedBox(height: 12),
            Expanded(
              // WIDGET 11: GridView
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _menu.length,
                itemBuilder: (context, index) {
                  final item = _menu[index];
                  return KfcCard(product: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
