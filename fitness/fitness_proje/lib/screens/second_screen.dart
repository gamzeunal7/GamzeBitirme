import 'package:fitness_proje/screens/home_screen.dart';
import 'package:fitness_proje/screens/third_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _counter = 0;
  int _selectedIndex = 0; // BottomNavigationBar için seçili öğe

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      // Anasayfa
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (index == 1) {
      // Egzersizlere Git
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThirdScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(79, 182, 182, 203),
      appBar: AppBar(
        title: const Text('Egzersiz Set Sayacı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/sayaç.png', width: 300),
                Positioned(
                  top: 46,
                  right: 80,
                  child: Text(
                    '$_counter',
                    style: const TextStyle(
                      fontFamily: 'Digital7',
                      fontSize: 50,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: _incrementButton(),
                ),
                Positioned(
                  right: 76,
                  bottom: 114,
                  child: _resetButton(),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[900], // Çubuğun arka plan rengi
        selectedItemColor: Colors.white, // Anasayfaya Gitin rengi
        unselectedItemColor: Colors.white, // Egzersize Gitin rengi
        currentIndex: _selectedIndex, // Seçili öğeyi takip ediyo
        onTap: _onItemTapped, // Tıkladığında çalışıyo
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fitness_center,
              size: 30,
            ),
            label: 'Egzersizlere Git',
          ),
        ],
      ),
    );
  }

  GestureDetector _resetButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _counter = 0;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent, // Butona turuncu renk verdim
          shape: BoxShape.circle, // Yuvarlak şekil verdim
        ),
        child: const Icon(Icons.refresh), // İkon ekledim
      ),
    );
  }

  GestureDetector _incrementButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _counter++;
        });
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.green, // Butona yeşil renk verdim
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
