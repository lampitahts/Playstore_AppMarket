import 'package:flutter/material.dart';

class AppModel {
  final String name;
  final String developer;
  final String rating;
  final String imageUrl;
  final String ulasan;
  final String Size;
  final String download;
  final String deskripsi;

  AppModel(
      {required this.name,
      required this.developer,
      required this.rating,
      required this.imageUrl,
      required this.ulasan,
      required this.Size,
      required this.download,
      required this.deskripsi});
}

class TopChartModel {
  final String name;
  final String kategori;
  final String imageUrl;
  final String rating;
  final String size;
  final String deskripsi;

  TopChartModel({
    required this.name,
    required this.kategori,
    required this.imageUrl,
    required this.rating,
    required this.size,
    required this.deskripsi,
  });
}

class ChildrenModel {
  final String name;
  final String kategori;
  final String developer;
  final String imageUrl;
  final String rating;
  final String deskripsi;
  final String Size;

  ChildrenModel(
      {required this.name,
      required this.kategori,
      required this.developer,
      required this.imageUrl,
      required this.rating,
      required this.deskripsi,
      required this.Size});
}


class Book {
  final String name;
  final String author;
  final String imageUrl;
  final String deskripsi;
  final String contoh;
  final String price;
  final String rating;
  final String Size;
  
  Book({
    required this.name,
    required this.author,
    required this.imageUrl,
    required this.deskripsi,
    required this.contoh,
    required this.price,
    required this.rating,
    required this.Size, 
  });
}


class CategoryModel {
  final String name;
  final IconData iconData;

  CategoryModel({required this.name, required this.iconData});
}

// Dummy data for categories
List<CategoryModel> categories = [
  CategoryModel(
    name: 'Smartwatch',
    iconData: Icons.watch,
  ),
  CategoryModel(
    name: 'Clock Faces',
    iconData: Icons.access_time,
  ),
  CategoryModel(
    name: 'Tools',
    iconData: Icons.build,
  ),
  CategoryModel(
    name: 'Android Auto',
    iconData: Icons.directions_car,
  ),
  CategoryModel(
    name: 'Shopping',
    iconData: Icons.shopping_cart,
  ),
  CategoryModel(
    name: 'News & Magazines',
    iconData: Icons.chrome_reader_mode,
  ),
  CategoryModel(
    name: 'Business',
    iconData: Icons.business,
  ),
  CategoryModel(
    name: 'Books & Reference',
    iconData: Icons.menu_book,
  ),
  CategoryModel(
    name: 'Weather',
    iconData: Icons.wb_sunny,
  ),
  CategoryModel(
    name: 'Events',
    iconData: Icons.event,
  ),
  CategoryModel(
    name: 'Photography',
    iconData: Icons.camera,
  ),
  CategoryModel(
    name: 'Games',
    iconData: Icons.games,
  ),
];
