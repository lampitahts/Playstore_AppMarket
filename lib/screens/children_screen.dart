import 'dart:async';
import 'package:flutter/material.dart';
import 'package:play_store_app/models/app_model.dart';
import 'package:play_store_app/Detail_screens/detail_children.dart';

class ChildrenScreen extends StatefulWidget {
  final List<ChildrenModel> childrenApps;
  final double imageSize;

  const ChildrenScreen({
    Key? key,
    required this.childrenApps,
    required this.imageSize,
  }) : super(key: key);

  @override
  _ChildrenScreenState createState() => _ChildrenScreenState();
}

class _ChildrenScreenState extends State<ChildrenScreen> {
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
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildBannerSection(),
        SizedBox(height: 16),
        _buildRecommendedForYouSection(context),
        SizedBox(height: 16),
        _buildEducationAppSection(context),
        SizedBox(height: 16),
        _buildEntertainSection(context),
        SizedBox(height: 16),
        _buildGamesForYouSection(context),
      ],
    );
  }

  Widget _buildBannerSection() {
    return SizedBox(
      height: 330,
      child: Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: PageView(
              controller: _pageController,
              children: [
                _buildImageCarouselItem(
                    "https://play-lh.googleusercontent.com/zHmfv0L0afqD7O0s5yh4IVPm8tOq-k_fBgNeAvNM_8ZfGFRt1Wv6fJE-fj5063t5ZxFz=w2560-h1440-rw"),
                _buildImageCarouselItem(
                    "https://support.khanacademy.org/hc/article_attachments/360007440612/KhanKids_LogoBanner_Landscape.jpg"),
                _buildImageCarouselItem(
                    "https://play-lh.googleusercontent.com/vIjuqAQjtZfM1iJBGJ4kiaRMr_PjC2gW1aKIIijzphSiMLGCr5gqj0ZWlAfwE2wj-2E=w2560-h1440-rw"),
                _buildImageCarouselItem(
                    "https://play-lh.googleusercontent.com/QVlSW25GSLpj_jO9zdYFMPqosLd31P42cpMzXs3jOXsr5v5BAo0f8w-IC6PsYTbikdo=w2560-h1440-rw"),
                _buildImageCarouselItem(
                    "https://play-lh.googleusercontent.com/HH3VYKmjLyYKMrs_lpivKF_oEMufEPDZb6WA2spV_U0OHUppwRuegZhwW4u_TiJZG58=w2560-h1440-rw"),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Aplikasi & game yang Disetujui Pengajar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
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
      width: widget.imageSize,
      height: widget.imageSize,
      fit: BoxFit.cover,
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
        SizedBox(height: 10),
        Container(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final app in widget.childrenApps)
                _buildRecommendedApp(context, app),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedApp(BuildContext context, ChildrenModel app) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailchildren(app: app),
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

  Widget _buildEducationAppSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Educational application',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final app in widget.childrenApps)
                _buildRecommendedApp(context, app),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEntertainSection(BuildContext context) {
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
        SizedBox(height: 10),
        Container(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final app in widget.childrenApps)
                _buildRecommendedApp(context, app),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGamesForYouSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Games you might like',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final app in widget.childrenApps)
                _buildRecommendedApp(context, app),
            ],
          ),
        ),
      ],
    );
  }
}
