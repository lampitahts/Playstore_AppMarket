import 'package:flutter/material.dart';
import 'package:play_store_app/Screens/install_update.screen.dart';

class KelolaAplikasi extends StatefulWidget {
  const KelolaAplikasi({Key? key}) : super(key: key);

  @override
  _KelolaAplikasiState createState() => _KelolaAplikasiState();
}

class _KelolaAplikasiState extends State<KelolaAplikasi>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Kelola aplikasi & perangkat",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.green,
          labelColor: Color.fromARGB(255, 44, 220, 252),
          unselectedLabelColor: Colors.white,
          tabs: const [
            Tab(text: "Ringkasan"),
            Tab(text: "Kelola"),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 248, 227, 247),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color.fromARGB(255, 196, 56, 231),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.shield,
                          color: Colors.green,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            "Tidak ditemukan aplikasi berbahaya",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Play Protect melakukan pemindaian 1 hari lalu",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color.fromARGB(255, 196, 56, 231),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.update,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            "Update",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Memeriksa update...",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InstallApp(
                              onUpdateAppList: (List<String> updatedList) {},
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Lihat update terkini",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  // Storage section
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color.fromARGB(255, 196, 56, 231),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.storage,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            "41 GB dari 51 GB digunakan",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: LinearProgressIndicator(
                      value: 0.8,
                      backgroundColor: Color.fromARGB(255, 196, 56, 231),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color.fromARGB(255, 196, 56, 231),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.sync,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            "Menyinkronkan aplikasi ke perangkat",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Tidak ada perangkat yang disinkronkan",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color.fromARGB(255, 196, 56, 231),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            "Bagikan aplikasi",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 4, 134, 167),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          child: Text(
                            "Kirim",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 111, 7, 138),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          child: Text(
                            "Terima",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color.fromARGB(255, 196, 56, 231),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            "Rating & ulasan",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color.fromARGB(255, 196, 56, 231),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.download,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            "Instal Aplikasi",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color.fromARGB(255, 196, 56, 231),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            "Hapus aplikasi",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color.fromARGB(255, 196, 56, 231),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.storage,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            "Ruang penyimpanan",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color.fromARGB(255, 196, 56, 231),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            "Pengaturan aplikasi",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Color.fromARGB(255, 196, 56, 231),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            "Notifikasi aplikasi",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

