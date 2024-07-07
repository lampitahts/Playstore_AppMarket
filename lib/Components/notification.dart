import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: <Widget>[
          NotificationItem(
            title: 'Notification 1',
            subtitle: 'This is the first notification.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationDetailPage(title: 'Notification 1')),
              );
            },
          ),
          NotificationItem(
            title: 'Notification 2',
            subtitle: 'This is the second notification.',
            onTap: () {
              // Aksi ketika notifikasi 2 diklik
              // Misalnya, navigasi ke halaman detail notifikasi 2
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationDetailPage(title: 'Notification 2')),
              );
            },
          ),
          // Tambahkan lebih banyak widget NotificationItem sesuai kebutuhan
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const NotificationItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}

class NotificationDetailPage extends StatelessWidget {
  final String title;

  const NotificationDetailPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Detail of $title'),
      ),
    );
  }
}
