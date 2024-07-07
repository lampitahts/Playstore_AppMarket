import 'package:flutter/material.dart';
import 'package:play_store_app/Detail_screens/detail_book.dart';
import 'package:play_store_app/models/app_model.dart';

class GenreBooksScreen extends StatelessWidget {
  final List<Book> genreBooks;
  final double imageSize;

  GenreBooksScreen({required this.genreBooks, required this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 230, 250),
      appBar: AppBar(
        title: Text('Genre Books'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: genreBooks.length,
          itemBuilder: (context, index) {
            final book = genreBooks[index];
            return _buildBookCard(context, book);
          },
        ),
      ),
    );
  }

  Widget _buildBookCard(BuildContext context, Book book) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(book.name),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 200,
                    child: Image.network(book.imageUrl,
                        width: imageSize * 2,
                        height: imageSize * 2), // Gambar diperbesar dua kali
                  ),
                  SizedBox(height: 10),
                  Text('Author: ${book.author}'),
                  Text('Rating: ${book.rating}'),
                ],
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlue[100],
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailbook(app: book),
                      ),
                    );
                  },
                  child: Text(
                    'Detail',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(book.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              width: imageSize * 1.5, // Gambar diperbesar 1.5 kali
              height: imageSize * 1.5, // Gambar diperbesar 1.5 kali
            ),
          ),
          SizedBox(height: 4),
          Text(
            book.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
