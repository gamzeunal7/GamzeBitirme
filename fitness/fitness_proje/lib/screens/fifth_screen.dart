import 'dart:convert';
import 'package:fitness_proje/models/urunler_model.dart';
import 'package:fitness_proje/screens/home_screen.dart';
import 'package:fitness_proje/screens/sixth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  UrunlerModel? _veriler;
  List<Urun> _urunler = [];

  void _loadData() async {
    final dataString = await rootBundle.loadString('assets/files/data.json');
    final dataJson = jsonDecode(dataString);

    _veriler = UrunlerModel.fromJson(dataJson);
    _urunler = _veriler!.urunler;
    setState(() {});
  }

  void _filterData(int id) {
    _urunler = _veriler!.urunler
        .where((verilerEleman) => verilerEleman.kategori == id)
        .toList();
    setState(() {});
  }

  void _resetFilter() {
    _urunler = _veriler!.urunler;
    setState(() {});
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürünler'),
      ),
      body: _veriler == null
          ? const Center(child: Text('Yükleniyor'))
          : SingleChildScrollView(
              // Kaydırma Çubuğu
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: _resetFilter,
                      child: const Text('Tüm Ürünler'),
                    ),
                    _kategorilerView(),
                    _urunlerView(),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  ListView _urunlerView() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _urunler.length,
      itemBuilder: (context, index) {
        final Urun urun = _urunler[index];
        return ListTile(
          leading: Image.network(urun.resim,
              width: 50, height: 50, fit: BoxFit.cover),
          title: Text(urun.isim),
        );
      },
      separatorBuilder: (context, index) => const Divider(height: 10),
    );
  }

  Row _kategorilerView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _veriler!.kategoriler.length,
        (index) {
          final kategori = _veriler!.kategoriler[index];
          return GestureDetector(
            onTap: () => _filterData(kategori.id),
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(kategori.isim),
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
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
          label: 'BMI Hesapla',
        ),
      ],
      currentIndex: 0, // Anasayfa item
      onTap: (index) {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SixthScreen()),
          );
        }
      },
      selectedItemColor: Colors.white, // Seçili öğenin rengi
      unselectedItemColor: Colors.white, // Seçili olmayan öğelerin rengi
      backgroundColor: Colors.blueGrey[900],
    );
  }
}
