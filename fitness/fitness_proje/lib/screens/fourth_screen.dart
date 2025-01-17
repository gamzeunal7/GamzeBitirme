import 'package:fitness_proje/screens/eight_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  String? eposta;
  String? sifre;

  void _getUserInfoFromDevice() async {
    final prefs = await SharedPreferences.getInstance();
    eposta = prefs.getString("eposta");
    sifre = prefs.getString("sifre");
    setState(() {});
  }

  @override
  void initState() {
    _getUserInfoFromDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Üyelik Bilgileriniz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Giriş Bilgileriniz: $eposta $sifre"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EightScreen()),
                );
              },
              child: Text('Devam Et'),
            ),
          ],
        ),
      ),
    );
  }
}
