import 'package:flutter/material.dart';

class AgeCategoryScreen extends StatefulWidget {
  const AgeCategoryScreen({super.key});

  @override
  _AgeCategoryScreenState createState() => _AgeCategoryScreenState();
}

class _AgeCategoryScreenState extends State<AgeCategoryScreen> {
  final TextEditingController _ageController = TextEditingController();
  String _category = '';

  void _determineCategory() {
    final int age = int.tryParse(_ageController.text) ?? -1;
    if (age < 0) {
      setState(() => _category = 'Edad inválida');
    } else if (age <= 10) {
      setState(() => _category = 'NIÑO');
    } else if (age <= 14) {
      setState(() => _category = 'PUBER');
    } else if (age <= 18) {
      setState(() => _category = 'ADOLESCENTE');
    } else if (age <= 25) {
      setState(() => _category = 'JOVEN');
    } else if (age <= 65) {
      setState(() => _category = 'ADULTO');
    } else {
      setState(() => _category = 'ANCIANO');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent, Colors.white],
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
                        Navigator.pop(context); // Regresa al menú
                      },
                    ),
                    const Spacer(),
                    const Text(
                      'Categoría por Edad',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  child: TextField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                      labelText: 'Ingresa tu edad',
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.blueAccent),
                    ),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: _determineCategory,
                  child: const Text(
                    'Determinar Categoría',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                if (_category.isNotEmpty)
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
                          'Resultado:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _category,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
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
}
