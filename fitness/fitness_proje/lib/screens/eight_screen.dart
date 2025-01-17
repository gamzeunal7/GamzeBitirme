import 'package:flutter/material.dart';
import 'package:fitness_proje/screens/home_screen.dart'; // HomeScreen için import
import 'package:fitness_proje/screens/third_screen.dart'; // ThirdScreen için import
import 'package:fitness_proje/screens/fifth_screen.dart'; // FifthScreen için import
import 'package:fitness_proje/screens/sixth_screen.dart'; // SixthScreen için import
import 'package:fitness_proje/screens/ninth_screen.dart'; // NinthScreen için import
import 'package:fitness_proje/screens/second_screen.dart'; // SecondScreen için import

class EightScreen extends StatelessWidget {
  const EightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final iconSize = screenWidth * 0.1; // İkon boyutu ekran genişliğine göre
    final textSize = screenWidth * 0.05; // Metin boyutu ekran genişliğine göre

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menü',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02), // Kenar boşlukları
        child: GridView.count(
          crossAxisCount: 2, // 2 sütun
          childAspectRatio: screenWidth / (screenHeight / 1.8), // Buton oranı
          children: [
            _buildMenuButton(
              context,
              icon: Icons.home,
              label: "Anasayfa",
              color: Colors.orangeAccent,
              iconSize: iconSize,
              textSize: textSize,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              ),
            ),
            _buildMenuButton(
              context,
              icon: Icons.fitness_center,
              label: "Egzersiz",
              color: Colors.greenAccent,
              iconSize: iconSize,
              textSize: textSize,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThirdScreen()),
              ),
            ),
            _buildMenuButton(
              context,
              icon: Icons.fastfood,
              label: "Yiyecek",
              color: Colors.redAccent,
              iconSize: iconSize,
              textSize: textSize,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FifthScreen()),
              ),
            ),
            _buildMenuButton(
              context,
              icon: Icons.straighten,
              label: "Vücut Kitle İndeksi",
              color: Colors.blueAccent,
              iconSize: iconSize,
              textSize: textSize,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SixthScreen()),
              ),
            ),
            _buildMenuButton(
              context,
              icon: Icons.bed,
              label: "Uyku",
              color: Colors.purpleAccent,
              iconSize: iconSize,
              textSize: textSize,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NinthScreen()),
              ),
            ),
            _buildMenuButton(
              context,
              icon: Icons.timer,
              label: "Sayaç",
              color: Colors.yellow.shade700,
              iconSize: iconSize,
              textSize: textSize,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context,
      {required IconData icon,
      required String label,
      required Color color,
      required double iconSize,
      required double textSize,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: iconSize, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
