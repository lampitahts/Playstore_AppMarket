import 'package:flutter/material.dart';
import 'package:play_store_app/Components/Setting.dart';
import 'package:play_store_app/models/app_data.dart';
import 'package:play_store_app/models/app_model.dart';
import 'package:play_store_app/Screens/book_screen.dart';
import 'package:play_store_app/Screens/categories_screen.dart';
import 'package:play_store_app/Screens/children_screen.dart';
import 'package:play_store_app/Components/custom_bottom_navigation_bar.dart';
import 'package:play_store_app/Screens/for_you_screen.dart';
import 'package:play_store_app/Screens/top_charts_screen.dart';
import 'package:play_store_app/Components/custom_drawer_widget.dart';
import 'package:play_store_app/Components/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<AppModel> forYouApps = appGamesData
      .map((app) => AppModel(
            name: app['name'],
            developer: app['developer'],
            rating: app['rating'],
            imageUrl: app['imageUrl'],
            ulasan: app['ulasan'],
            Size: app['Size'],
            download: app['download'],
            deskripsi: app['deskripsi'],
          ))
      .toList();

  final List<TopChartModel> topCharts = topcharts
      .map((app) => TopChartModel(
            name: app['name'],
            kategori: app['kategori'],
            imageUrl: app['imageUrl'],
            rating: app['rating'],
            size: app['Size'],
            deskripsi: app['deskripsi'],
          ))
      .toList();

  List<ChildrenModel> childrenApps = childrenZone.map((app) {
    return ChildrenModel(
      name: app['name'],
      kategori: app['kategori'],
      imageUrl: app['imageUrl'],
      rating: app['rating'],
      developer: app['developer'],
      deskripsi: app['deskripsi'],
      Size: app['Size'],
    );
  }).toList();

  final List<Book> genreBooks = appBooksData
      .map((app) => Book(
            name: app['name'],
            author: app['author'],
            rating: app['rating'],
            imageUrl: app['imageUrl'],
            deskripsi: app['deskripsi'],
            contoh: app['contoh'],
            price: app['price'],
            Size: app['Size'],
          ))
      .toList();

  final List<AppModel> searchResults = [];
  final List<TopChartModel> topChartsSearchResults = [];
  final List<ChildrenModel> childrenSearchResults = [];
  final List<Book> bookSearchResults = [];

  double _imageSize = 100.0;
  bool _isSliderVisible = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String searchValue) {
    print('Searching for: $searchValue');
    setState(() {
      searchResults.clear();
      topChartsSearchResults.clear();
      childrenSearchResults.clear();
      bookSearchResults.clear();

      searchResults.addAll(forYouApps.where(
          (app) => app.name.toLowerCase().contains(searchValue.toLowerCase())));

      topChartsSearchResults.addAll(topCharts.where(
          (app) => app.name.toLowerCase().contains(searchValue.toLowerCase())));

      childrenSearchResults.addAll(childrenApps.where(
          (app) => app.name.toLowerCase().contains(searchValue.toLowerCase())));

      bookSearchResults.addAll(genreBooks.where((book) =>
          book.name.toLowerCase().contains(searchValue.toLowerCase())));
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 245, 241, 244)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: SearchBarWidget(
            onSearchSubmitted: _onSearchSubmitted,
          ),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 4, color: Colors.blue),
              ),
            ),
            labelColor: Color.fromARGB(255, 128, 226, 210),
            unselectedLabelColor: Color.fromARGB(255, 238, 243, 243),
            tabs: [
              Tab(text: 'For You'),
              Tab(text: 'Top Charts'),
              Tab(text: 'Children'),
              Tab(text: 'Premium'),
              Tab(text: 'Categories'),
            ],
          ),
        ),
        backgroundColor:
            colorProvider?.color ?? Color.fromARGB(255, 250, 237, 248),
        body: Stack(children: [
          TabBarView(
            controller: _tabController,
            children: [
              ForYouScreen(
                forYouApps:
                    searchResults.isNotEmpty ? searchResults : forYouApps,
                imageSize: _imageSize,
              ),
              TopChartsScreen(
                topCharts: topChartsSearchResults.isNotEmpty
                    ? topChartsSearchResults
                    : topCharts,
                imageSize: _imageSize,
              ),
              ChildrenScreen(
                childrenApps: childrenSearchResults.isNotEmpty
                    ? childrenSearchResults
                    : childrenApps,
                imageSize: _imageSize,
              ),
              GenreBooksScreen(
                genreBooks: bookSearchResults.isNotEmpty
                    ? bookSearchResults
                    : genreBooks,
                imageSize: _imageSize,
              ),
              CategoriesScreen(categories: categories),
            ],
          ),
          Positioned(
            right: 8,
            top: 5,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color:
                        Color.fromARGB(255, 243, 114, 211), // Background color
                    shape: BoxShape.circle, // Circular shape
                  ),
                  child: IconButton(
                    icon: Icon(Icons.tune),
                    color: Colors.white, // Icon color
                    onPressed: () {
                      setState(() {
                        _isSliderVisible = !_isSliderVisible;
                      });
                    },
                  ),
                ),
                if (_isSliderVisible)
                  Container(
                    height: 200,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Slider(
                        value: _imageSize,
                        min: 90,
                        max: 120,
                        onChanged: (value) {
                          setState(() {
                            _imageSize = value;
                          });
                        },
                      ),
                    ),
                  ),
              ],
            ),
          )
        ]),
        bottomNavigationBar: CustomBottomNavigationBar(
          onTabTapped: _onTabTapped,
        ),
        drawer: Drawer(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: CustomDrawer(
              onMenuItemClicked: (index) {
                print('Menu item clicked: $index');
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
