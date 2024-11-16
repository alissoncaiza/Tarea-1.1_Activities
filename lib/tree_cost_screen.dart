import 'package:flutter/material.dart';

class TreeCostScreen extends StatefulWidget {
  const TreeCostScreen({super.key});

  @override
  _TreeCostScreenState createState() => _TreeCostScreenState();
}

class _TreeCostScreenState extends State<TreeCostScreen> {
  final TextEditingController _paltosController = TextEditingController();
  final TextEditingController _limonesController = TextEditingController();
  final TextEditingController _chirimoyosController = TextEditingController();
  double _totalCost = 0.0;

  void _calculateTreeCost() {
    final int qtyPaltos = int.tryParse(_paltosController.text) ?? 0;
    final int qtyLimones = int.tryParse(_limonesController.text) ?? 0;
    final int qtyChirimoyos = int.tryParse(_chirimoyosController.text) ?? 0;

    const double pricePaltos = 1200;
    const double priceLimones = 1000;
    const double priceChirimoyos = 980;

    double discountPaltos = qtyPaltos > 100 && qtyPaltos <= 300 ? 0.10 : qtyPaltos > 300 ? 0.18 : 0;
    double discountLimones = qtyLimones > 100 && qtyLimones <= 300 ? 0.125 : qtyLimones > 300 ? 0.20 : 0;
    double discountChirimoyos = qtyChirimoyos > 100 && qtyChirimoyos <= 300 ? 0.145 : qtyChirimoyos > 300 ? 0.19 : 0;

    double costPaltos = qtyPaltos * pricePaltos * (1 - discountPaltos);
    double costLimones = qtyLimones * priceLimones * (1 - discountLimones);
    double costChirimoyos = qtyChirimoyos * priceChirimoyos * (1 - discountChirimoyos);

    double subtotal = costPaltos + costLimones + costChirimoyos;

    if (qtyPaltos + qtyLimones + qtyChirimoyos > 1000) {
      subtotal *= 0.85; // Descuento adicional por más de 1000 árboles
    }

    setState(() {
      _totalCost = subtotal * 1.19; // Incluye IVA
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.lightGreen, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Botón de regreso al menú
                      },
                    ),
                    const Spacer(),
                    const Text(
                      'Costo de Árboles',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 40),
                _buildInputField(
                  controller: _paltosController,
                  label: 'Cantidad de Paltos',
                ),
                const SizedBox(height: 10),
                _buildInputField(
                  controller: _limonesController,
                  label: 'Cantidad de Limones',
                ),
                const SizedBox(height: 10),
                _buildInputField(
                  controller: _chirimoyosController,
                  label: 'Cantidad de Chirimoyos',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: _calculateTreeCost,
                  child: const Text(
                    'Calcular Costo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                if (_totalCost > 0)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Costo Total (con IVA):',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '\$${_totalCost.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(2, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.green),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
