import 'package:flutter/material.dart';

class BildirimScreen extends StatefulWidget {
  @override
  _BildirimScreenState createState() => _BildirimScreenState();
}

class _BildirimScreenState extends State<BildirimScreen> {
  void showNotification(String message) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: NotificationWidget(
            message: message,
            onDismissed: () {
              overlayEntry.remove();
            },
          ),
        ),
      ),
    );

    // Bildirimi overlay'e ekleyelim
    overlay.insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bildirim Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showNotification("BUGÜNKÜ KALORİ HEDEFİNE ULAŞTIN!");
              },
              child: Text("1. Bildirim Göster"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showNotification("SU İÇMEYİ UNUTMA");
              },
              child: Text("2. Bildirim Göster"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showNotification(
                    "BUGÜN PROTEİN AÇISINDAN ZENGİN BİR ÖĞÜNE NE DERSİN?");
              },
              child: Text("3. Bildirim Göster"),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationWidget extends StatefulWidget {
  final String message;
  final VoidCallback onDismissed;

  NotificationWidget({
    required this.message,
    required this.onDismissed,
  });

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animasyon kontrolcüsü tanımlanıyor
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    // Fade-in ve fade-out animasyonu
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Bildirim giriş animasyonu
    _controller.forward();

    // Bildirimi 2 saniye sonra otomatik kapatma
    Future.delayed(Duration(seconds: 2), () {
      _controller.reverse().then((value) {
        widget.onDismissed();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.8), // Blur grey renk
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
