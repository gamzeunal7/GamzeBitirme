import 'package:fitness_proje/screens/fourth_screen.dart';
import 'package:fitness_proje/screens/second_screen.dart'; //ileri gitmesi için import
import 'package:fitness_proje/screens/home_screen.dart'; // tıkladığında anasayfaya gitmesi için import
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _epostaController = TextEditingController();
  final _sifreController = TextEditingController();

  void _saveUserToDevice() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("eposta", _epostaController.text);
    prefs.setString("sifre", _sifreController.text);
  }

  void _checkUserFromDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final String? eposta = prefs.getString("eposta");
    final String? sifre = prefs.getString("sifre");
    if (eposta != null && sifre != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FourthScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    _checkUserFromDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300, // Arka plan rengi
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _epostaController,
                decoration: const InputDecoration(
                  labelText: "Kullanıcı Adı",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sifreController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Şifre",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _saveUserToDevice();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                child: const Text("Giriş Yap"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_right_rounded, size: 30),
            label: 'Giriş Yapmadan Devam Et',
          ),
        ],
        currentIndex: 0, //Anasayfa item
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          }
        },
        selectedItemColor: Colors.white, // Anasayfa ikonun rengi
        unselectedItemColor: Colors.white, // Giriş yapmadanın rengi
        backgroundColor: Colors.blueGrey[900], // B.Navigation arka plan rengi
      ),
    );
  }
}
