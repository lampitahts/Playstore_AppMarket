import 'package:flutter/material.dart';
import 'package:play_store_app/Components/Setting.dart';
import 'package:play_store_app/Detail_screens/detail_forYou.dart';
import '../models/app_model.dart';
import 'dart:async';


class ForYouScreen extends StatefulWidget {
  final List<AppModel> forYouApps;
  final double imageSize;

  const ForYouScreen({
    Key? key,
    required this.forYouApps,
    required this.imageSize,
  }) : super(key: key);

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        if (_currentPage >= 5) {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final colorProvider = ColorProvider.of(context);

    return Container(
      color: colorProvider?.color ?? Color.fromARGB(255, 253, 230, 250),
      child: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          if (widget.forYouApps.isNotEmpty) _buildTrendingSection(widget.forYouApps[0]),
          SizedBox(height: 12),
          _buildRecommendedForYouSection(context),
          SizedBox(height: 10),
          _buildTopRatedGamesSection(widget.forYouApps),
          SizedBox(height: 40),
          _buildLiveEventsSection(context),
          SizedBox(height: 25),
          _buildRecommendedForYouAlternate(widget.forYouApps),
          SizedBox(height: 20),
          _buildLiveEntertainmentSection(context),
          SizedBox(height: 10),
          _buildTTrendingSection(widget.forYouApps),
          SizedBox(height: 30),
          _buildLiveGameOfflineSection(context),
        ],
      ),
    );
  }

  Widget _buildTrendingSection(AppModel app) {
    return SizedBox(
      height: 330,
      child: Column(
        children: [
          SizedBox(
            height: 240,
            width: double.infinity,
            child: PageView(
              controller: _pageController,
              children: [
                _buildImageCarouselItem(
                    "https://www.91-cdn.com/hub/wp-content/uploads/2022/06/gi-1.jpg"),
                _buildImageCarouselItem(
                    "https://images.hindustantimes.com/tech/img/2020/08/14/960x540/fortniteseason13-1920x1080-180726744_1597396688994_1597396702912.jpg"),
                _buildImageCarouselItem(
                    "https://in-exstatic-vivofs.vivo.com/bCy1HLzT9bUXp6Mb/IN-IQOO/threadResource/20231018/6df841fd021a4a13939d05fd1368c47d_w739_h415.png"),
                _buildImageCarouselItem(
                    "https://i.insider.com/5e9f567dd553f819d366c565?width=1000&format=jpeg&auto=webp"),
                _buildImageCarouselItem(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe0Cmy5N--kx5XX7Sa0RRiqn5dbO_GwQNieg&s"),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${app.name} by ${app.developer} - Rating: ${app.rating}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.star,
                color: Colors.orange,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarouselItem(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: widget.imageSize,
      height: widget.imageSize,
    );
  }

  Widget _buildRecommendedForYouSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended For You',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        SizedBox(height: 8),
        Container(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final app in widget.forYouApps) _buildRecommendedApp(context, app),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedApp(BuildContext context, AppModel app) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailforyou(app: app),
          ),
        );
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              app.imageUrl,
              height: widget.imageSize,
              width: widget.imageSize,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 4),
            Text(
              app.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRatedGamesSection(List<AppModel> forYouApps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Rated Games',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 250,
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: forYouApps.length,
            itemBuilder: (context, index) {
              return _buildTopRatedGameCard(forYouApps[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTopRatedGameCard(AppModel app) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
            height: 180,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe4LPsqqp7oU45TtUd-7wB_gKF7-uivW_slQ&s",
                      fit: BoxFit.cover,
                      height: widget.imageSize,
                      width: widget.imageSize,
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mobile Legends: adalah permainan MOBA yang populer',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ])));
  }

  Widget _buildLiveEventsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Live Events',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.forYouApps.length,
            itemBuilder: (context, index) {
              return _buildLiveEventCard(context, widget.forYouApps[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLiveEventCard(BuildContext context, AppModel app) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailforyou(app: app),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                app.imageUrl,
                height: widget.imageSize,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  app.name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedForYouAlternate(List<AppModel> forYouApps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Terbaik',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 4 * widget.imageSize + 2 * 8,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (forYouApps.length / 3).ceil(),
            itemBuilder: (context, pageIndex) {
              int appsPerPage = 3;
              int startIndex = pageIndex * appsPerPage;
              int endIndex = (pageIndex + 1) * appsPerPage;
              if (endIndex > forYouApps.length) {
                endIndex = forYouApps.length;
              }
              List<AppModel> pageApps =
                  forYouApps.sublist(startIndex, endIndex);

              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pageApps.map((app) {
                    return _buildRecommendedAppAlternate(context, app);
                  }).toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedAppAlternate(BuildContext context, AppModel app) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailforyou(app: app),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              app.imageUrl,
              height: widget.imageSize,
              width: widget.imageSize,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5), // Spasi antara gambar dan nama
            Container(
              width: widget.imageSize,
              child: Text(
                app.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13),
              ),
            ),
            SizedBox(height: 8), // Spasi antara nama dan gambar di bawahnya
          ],
        ),
      ),
    );
  }

  Widget _buildLiveEntertainmentSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Entertainment',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        SizedBox(height: 10),
        Container(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final app in widget.forYouApps) _buildRecommendedApp(context, app),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLiveEntertainmentCard(BuildContext context, AppModel app) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailforyou(app: app),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              app.imageUrl,
              height: widget.imageSize,
              width: widget.imageSize,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 4),
            Text(
              app.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTTrendingSection(List<AppModel> forYouApps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tranding',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 250,
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: forYouApps.length,
            itemBuilder: (context, index) {
              return _buildTrendingTopCard(forYouApps[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingTopCard(AppModel app) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
            height: 180,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      "https://store-images.s-microsoft.com/image/apps.7458.13510798882606697.b6a31126-a832-4c65-8788-783028e60938.f9619292-7e34-4b90-b30f-98c1ff47cd7f",
                      fit: BoxFit.cover,
                      height: widget.imageSize,
                      width: widget.imageSize,
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Candy Crush Saga adalah permainan teka-teki',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ])));
  }

  Widget _buildLiveGameOfflineSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Game Offline',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        SizedBox(height: 10),
        Container(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final app in widget.forYouApps) _buildRecommendedApp(context, app),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLiveGameOfflineCard(BuildContext context, AppModel app) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailforyou(app: app),
          ),
        );
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              app.imageUrl,
              height: widget.imageSize,
              width: widget.imageSize,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 4),
            Text(
              app.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
