import 'package:flutter/material.dart';
import 'package:fitness_proje/screens/home_screen.dart';
import 'package:fitness_proje/screens/seventh_screen.dart'; // SeventScreen tanımlı

class SixthScreen extends StatefulWidget {
  const SixthScreen({Key? key}) : super(key: key);

  @override
  State<SixthScreen> createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {
  final TextEditingController _boyController = TextEditingController();
  final TextEditingController _kiloController = TextEditingController();

  double _sonuc = 0.0;
  String _hataMesaji = '';

  String _getBMICategory() {
    if (_sonuc < 18.5) {
      return "Zayıf";
    } else if (_sonuc >= 18.5 && _sonuc < 24.9) {
      return "Normal";
    } else if (_sonuc >= 25 && _sonuc < 29.9) {
      return "Kilolu";
    } else if (_sonuc >= 30) {
      return "Obez";
    } else {
      return "";
    }
  }

  Color _getBMICategoryColor() {
    if (_sonuc < 18.5) {
      return Colors.blueAccent; // Zayıf için renk
    } else if (_sonuc >= 18.5 && _sonuc < 24.9) {
      return Colors.green; // Normal için renk
    } else if (_sonuc >= 25 && _sonuc < 29.9) {
      return Colors.orange; // Kilolu için renk
    } else if (_sonuc >= 30) {
      return Colors.red; // Obez için renk
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vücut Kitle Endeksi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Sonuç: ${_sonuc.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 32),
              textAlign: TextAlign.center,
            ),
            if (_hataMesaji.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  _hataMesaji,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            if (_sonuc > 0) // Eğer BMI hesaplanmışsa kutucuk gösterilecek
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: _getBMICategoryColor(),
                    borderRadius:
                        BorderRadius.circular(12), // Yuvarlatılmış köşeler
                  ),
                  child: Text(
                    _getBMICategory(),
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white, // Yazı rengi beyaz
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            TextField(
              controller: _boyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Boyunuz",
                suffixText: "m",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _kiloController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Kilonuz",
                suffixText: "kg",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text(
                "Hesapla",
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                _hesapla();
              },
            ),
          ],
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
            icon: Icon(Icons.restaurant, size: 30),
            label: 'Besin Değeri',
          ),
        ],
        currentIndex: 0, // Varsayılan olarak Anasayfa seçili
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SeventhScreen()),
            );
          }
        },
        selectedItemColor: Colors.white, // Seçili öğenin rengi
        unselectedItemColor: Colors.white, // Seçili olmayan öğelerin rengi
        backgroundColor: Colors.blueGrey[900], // Arka plan rengi
      ),
    );
  }

  void _hesapla() {
    setState(() {
      _hataMesaji = ""; // Önce hata mesajını sıfırla
    });

    String boyText = _boyController.text.trim();
    String kiloText = _kiloController.text.trim();

    if (boyText.isEmpty || kiloText.isEmpty) {
      setState(() {
        _hataMesaji = "Lütfen boy ve kilo bilgilerini doldurun.";
      });
      return;
    }

    try {
      double boy = double.parse(boyText);
      double kilo = double.parse(kiloText);

      if (boy <= 0 || kilo <= 0) {
        setState(() {
          _hataMesaji = "Boy ve kilo sıfırdan büyük olmalıdır.";
        });
        return;
      }

      setState(() {
        _sonuc = kilo / (boy * boy);
      });
    } catch (e) {
      setState(() {
        _hataMesaji = "Lütfen geçerli bir sayı girin (ör. 1.75).";
      });
    }
  }
}
