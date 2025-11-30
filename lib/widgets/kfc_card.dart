import 'package:flutter/material.dart';


class KfcCard extends StatefulWidget {
  final Map<String, dynamic> product;
  const KfcCard({super.key, required this.product});

  @override
  State<KfcCard> createState() => _KfcCardState();
}

class _KfcCardState extends State<KfcCard> {
  bool _extraSauce = false;
  bool _spicy = false;
  int _size = 0;

  void _showDetailsDialog() {
    final controller = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (context) {
        bool tmpExtra = _extraSauce;
        bool tmpSpicy = _spicy;
        int tmpSize = _size;
        return StatefulBuilder(builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Opciones y nota'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // WIDGET 14: TextField
                  TextField(
                    controller: controller,
                    decoration:
                        const InputDecoration(hintText: 'Ej: sin cebolla'),
                  ),
                  const SizedBox(height: 12),
                  // WIDGET 13: Switch / Checkbox / Radio
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Salsa extra'),
                    value: tmpExtra,
                    onChanged: (v) =>
                        setDialogState(() => tmpExtra = v ?? false),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Picante'),
                    value: tmpSpicy,
                    onChanged: (v) => setDialogState(() => tmpSpicy = v),
                  ),
                  const SizedBox(height: 8),
                  RadioListTile<int>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text('Pequeño'),
                    value: 0,
                    groupValue: tmpSize,
                    onChanged: (v) => setDialogState(() => tmpSize = v ?? 0),
                  ),
                  RadioListTile<int>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text('Mediano'),
                    value: 1,
                    groupValue: tmpSize,
                    onChanged: (v) => setDialogState(() => tmpSize = v ?? 1),
                  ),
                  RadioListTile<int>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text('Grande'),
                    value: 2,
                    groupValue: tmpSize,
                    onChanged: (v) => setDialogState(() => tmpSize = v ?? 2),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar')),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _extraSauce = tmpExtra;
                    _spicy = tmpSpicy;
                    _size = tmpSize;
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Opciones guardadas')));
                },
                child: const Text('Guardar'),
              ),
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        // WIDGET 7: Container
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // WIDGET 5: Stack
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/${product['id']}/600/400',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.red.shade700.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text('OFERTA',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ),
                  ],
                ),
              ),
              // WIDGET 4: Column / Row
              // WIDGET 6: Expanded / Flexible
              Flexible(
                fit: FlexFit.loose,
                // WIDGET 8: Padding / Center / Align
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          product['name'],
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product['desc'],
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.black54),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // WIDGET 9: SizedBox
                      Text('\$${product['price']}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w800)),
                      const SizedBox(height: 8),
                      // WIDGET 12: ElevatedButton / TextButton / OutlinedButton
                      // WIDGET 9: SizedBox
                      SizedBox(
                        height: 44,
                        child: Row(
                          children: [
                            // WIDGET 6: Expanded / Flexible
                            // WIDGET 12: ElevatedButton
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () => ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text(
                                            '${product['name']} añadido'))),
                                icon: const Icon(Icons.add_shopping_cart,
                                    size: 16),
                                label: const Text('Añadir'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade700,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  minimumSize: const Size(0, 44),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // WIDGET 12: OutlinedButton
                            Expanded(
                              child: OutlinedButton(
                                onPressed: _showDetailsDialog,
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red.shade700,
                                  side: BorderSide(color: Colors.red.shade200),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  minimumSize: const Size(0, 44),
                                ),
                                child: const Text('Detalles'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
