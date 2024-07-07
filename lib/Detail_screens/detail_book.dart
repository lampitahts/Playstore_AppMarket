import 'package:flutter/material.dart';
import 'package:play_store_app/Components/pembayaran.dart';
import 'package:play_store_app/Screens/install_update.screen.dart';
import 'package:play_store_app/models/app_model.dart';
import 'package:play_store_app/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Detailbook extends StatefulWidget {
  final Book app;

  const Detailbook({Key? key, required this.app}) : super(key: key);

  @override
  _DetailbookState createState() => _DetailbookState();
}

class _DetailbookState extends State<Detailbook> {
  List<Review> reviews = [];

  TextEditingController _reviewController = TextEditingController();
  int _selectedRating = 0;
  bool _isInstalling = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.app.name),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Bagikan'),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Tambahkan ke Wishlist'),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.block),
                  title: Text('Tandai Konten sebagai Tidak Pantas'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => SingleChoiceDialog(),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Stack(
                          children: [
                            Image.network(
                              widget.app.imageUrl,
                            ),
                            if (_isInstalling)
                              Positioned.fill(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.app.name,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              widget.app.author,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '${widget.app.author} · Digital Book',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            ElevatedButton(
                              onPressed: () {
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Pembayaran()),
                                  );
                                }
                              },
                              child: Text(
                                'Beli ${widget.app.price}',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  _isInstalling = true;
                                });

                                Future.delayed(Duration(seconds: 5), () async {
                                  setState(() {
                                    _isInstalling = false;
                                  });
                                  var url = widget.app.contoh;
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                });
                              },
                              child: Text('Contoh Gratis'),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50),
                              ),
                              
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [],
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Tentang Buku ini',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "${widget.app.deskripsi}",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Seri'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Koleksi Sastra dan Fiksi'),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Acara & penawaran',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              widget.app.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          height: 200.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              widget.app.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keamanan Data',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Keamanan dimulai dengan memahami cara author mengumpulkan dan membagikan data Anda. Praktik privasi dan keamanan data dapat bervariasi berdasarkan penggunaan, wilayah, dan usia Anda. author memberikan informasi ini dan dapat memperbaruinya seiring waktu.',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Icon(Icons.share),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                'Tidak ada data yang dibagikan kepada pihak ketiga',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.cloud_upload),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                'Aplikasi ini dapat mengumpulkan jenis data berikut',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.lock),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                'Data dienkripsi saat dalam pengiriman',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.delete),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                'Penghapusan akun tersedia',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.info),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                'Anda dapat meminta untuk menghapus data yang dikumpulkan',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Lihat detail'),
                        ),
                        SizedBox(height: 24.0),
                        Text(
                          'Beri rating aplikasi ini',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Sampaikan pendapat Anda',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _selectedRating = 1;
                                });
                              },
                              icon: Icon(
                                Icons.star,
                                size: 30.0,
                                color: _selectedRating >= 1
                                    ? Colors.amber
                                    : Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _selectedRating = 2;
                                });
                              },
                              icon: Icon(
                                Icons.star,
                                size: 30.0,
                                color: _selectedRating >= 2
                                    ? Colors.amber
                                    : Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _selectedRating = 3;
                                });
                              },
                              icon: Icon(
                                Icons.star,
                                size: 30.0,
                                color: _selectedRating >= 3
                                    ? Colors.amber
                                    : Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _selectedRating = 4;
                                });
                              },
                              icon: Icon(
                                Icons.star,
                                size: 30.0,
                                color: _selectedRating >= 4
                                    ? Colors.amber
                                    : Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _selectedRating = 5;
                                });
                              },
                              icon: Icon(
                                Icons.star,
                                size: 30.0,
                                color: _selectedRating >= 5
                                    ? Colors.amber
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          controller: _reviewController,
                          decoration: InputDecoration(
                            hintText: 'Tulis ulasan Anda',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 5,
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            reviews.add(Review(
                              user_name: "",
                              date: DateTime.now().toString(),
                              rating: _selectedRating,
                              content: _reviewController.text,
                              helpfulCount: 0,
                            ));
                            _reviewController.clear();
                            _selectedRating = 0;
                            setState(() {});
                          },
                          child: Text('Kirim'),
                        ),
                        SizedBox(height: 24.0),
                        Text(
                          'Rating dan ulasan',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Rating dan ulasan diverifikasi dan berasal dari orang yang',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Berpartisipasi secara langsung dalam pengalaman aplikasi di platform ini.',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.app.rating,
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.app.rating,
                            )
                          ],
                        ),
                        SizedBox(height: 16.0),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: reviews.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              title: Text(reviews[index].user_name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("user"),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: reviews[index].rating >= 1
                                            ? Colors.amber
                                            : Colors.grey,
                                        size: 18.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: reviews[index].rating >= 2
                                            ? Colors.amber
                                            : Colors.grey,
                                        size: 18.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: reviews[index].rating >= 3
                                            ? Colors.amber
                                            : Colors.grey,
                                        size: 18.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: reviews[index].rating >= 4
                                            ? Colors.amber
                                            : Colors.grey,
                                        size: 18.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: reviews[index].rating >= 5
                                            ? Colors.amber
                                            : Colors.grey,
                                        size: 18.0,
                                      ),
                                      SizedBox(width: 4.0),
                                      Text(reviews[index].rating.toString()),
                                    ],
                                  ),
                                  Text(reviews[index].content),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.thumb_up),
                                onPressed: () {
                                  setState(() {
                                    reviews[index].helpfulCount++;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Review {
  final String user_name;
  final String date;
  final int rating;
  final String content;
  int helpfulCount;

  Review({
    required this.user_name,
    required this.date,
    required this.rating,
    required this.content,
    this.helpfulCount = 0,
  });
}
