import 'package:fitness_proje/screens/eight_screen.dart';
import 'package:fitness_proje/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Syncfusion Chart kütüphanesi

class NinthScreen extends StatefulWidget {
  const NinthScreen({super.key});

  @override
  State<NinthScreen> createState() => _NinthScreenState();
}

class _NinthScreenState extends State<NinthScreen> {
  late List<ChartData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true); // Tooltip etkinleştirildi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uyku Grafiği'),
      ),
      body: SfCartesianChart(
        title: ChartTitle(text: 'Günlük Uyku ve Uyanıklık Saatleri'),
        tooltipBehavior: _tooltipBehavior,
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 24, interval: 4),
        series: <ChartSeries>[
          ColumnSeries<ChartData, String>(
            // Uyku saatleri serisi
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.day,
            yValueMapper: (ChartData data, _) => data.sleepHours,
            name: 'Uyku Saatleri',
            color: Colors.blueGrey,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
          ColumnSeries<ChartData, String>(
            // Uyanıklık saatleri serisi
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.day,
            yValueMapper: (ChartData data, _) => data.awakeHours,
            name: 'Uyanıklık Saatleri',
            color: Colors.orange,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
      bottomNavigationBar:
          _buildBottomNavigationBar(context), // Bottom Navigation Bar ekle
    );
  }

  List<ChartData> getChartData() {
    final List<ChartData> chartData = [
      ChartData('Pazartesi', 7, 17),
      ChartData('Salı', 8, 16),
      ChartData('Çarşamba', 6, 18),
      ChartData('Perşembe', 9, 15),
      ChartData('Cuma', 8, 16),
      ChartData('Cumartesi', 10, 14),
      ChartData('Pazar', 14, 10),
    ];
    return chartData;
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
          icon: Icon(Icons.menu, size: 30),
          label: 'Menü',
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
            MaterialPageRoute(
                builder: (context) => EightScreen()), // SixthScreen() ile geçiş
          );
        }
      },
      selectedItemColor: Colors.white, // Seçili öğenin rengi
      unselectedItemColor: Colors.white, // Seçili olmayan öğelerin rengi
      backgroundColor: Colors.blueGrey[900],
    );
  }
}

class ChartData {
  ChartData(this.day, this.sleepHours, this.awakeHours);

  final String day;
  final double sleepHours;
  final double awakeHours;
}
