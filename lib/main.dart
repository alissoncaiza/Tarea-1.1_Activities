import 'package:flutter/material.dart';

// Importar las pantallas correspondientes
import 'age_category_screen.dart';
import 'shirt_discount_screen.dart';
import 'pythagorean_screen.dart';
import 'electricity_screen.dart';
import 'salary_screen.dart';
import 'tree_cost_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menú de Opciones',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.orange.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 3, // Tres columnas para reducir el tamaño de los recuadros
            crossAxisSpacing: 12, // Espaciado entre columnas
            mainAxisSpacing: 12, // Espaciado entre filas
            children: [
              _buildMenuCard(
                context,
                title: 'Edad',
                icon: Icons.child_care,
                color: Colors.lightBlueAccent,
                screen: const AgeCategoryScreen(),
              ),
              _buildMenuCard(
                context,
                title: 'Camisas',
                icon: Icons.local_offer,
                color: Colors.amberAccent,
                screen: const ShirtDiscountScreen(),
              ),
              _buildMenuCard(
                context,
                title: 'terna pitagórica',
                icon: Icons.check_circle_outline,
                color: Colors.greenAccent,
                screen: const PythagoreanScreen(),
              ),
              _buildMenuCard(
                context,
                title: 'Electricidad',
                icon: Icons.electric_bolt,
                color: Colors.yellowAccent,
                screen: const ElectricityScreen(),
              ),
              _buildMenuCard(
                context,
                title: 'Salario',
                icon: Icons.monetization_on,
                color: Colors.purpleAccent,
                screen: const SalaryScreen(),
              ),
              _buildMenuCard(
                context,
                title: 'Árboles',
                icon: Icons.nature,
                color: Colors.tealAccent,
                screen: const TreeCostScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context,
      {required String title,
        required IconData icon,
        required Color color,
        required Widget screen}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 2,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20, // Radio reducido para íconos más pequeños
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, size: 24, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14, // Texto más pequeño
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
