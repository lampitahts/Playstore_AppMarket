import 'package:flutter/material.dart';

class PlayProtectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Protect'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.check_circle, color: Colors.white, size: 50),
                  SizedBox(height: 16),
                  Text(
                    'Tidak ditemukan aplikasi berbahaya',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Play Protect memindai pada 08.23',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: Text('Pindai'),
            ),
            SizedBox(height: 24),
            Text('Aplikasi yang baru-baru ini dipindai',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Contoh gambar aplikasi yang ditampilkan
                  _buildAppIcon('assets/app_icon1.png'),
                  _buildAppIcon('assets/app_icon2.png'),
                  _buildAppIcon('assets/app_icon3.png'),
                  // Tambahkan lebih banyak ikon sesuai kebutuhan
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Play Protect secara rutin memeriksa aplikasi dan perangkat Anda untuk mencari kemungkinan perilaku berbahaya. Anda akan diberi tahu jika ditemukan risiko keamanan.',
            ),
            TextButton(
              onPressed: () {},
              child: Text('Pelajari lebih lanjut',
                  style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Image.asset(
        assetPath,
        width: 50,
        height: 50,
      ),
    );
  }
}
