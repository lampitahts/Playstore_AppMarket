import 'package:flutter/material.dart';
import 'package:play_store_app/models/app_model.dart';
import 'package:play_store_app/Detail_screens/detail_topCharts.dart';

class TopChartsScreen extends StatelessWidget {
  final List<TopChartModel> topCharts;
  final double imageSize;

  const TopChartsScreen({
    Key? key,
    required this.topCharts,
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: topCharts.length,
      itemBuilder: (context, index) {
        final app = topCharts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailTopChart(app: app),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 100,
            child: Row(
              children: [
                Text((index + 1).toString()),
                SizedBox(width: 8),
                Image.network(
                  app.imageUrl,
                  width: imageSize / 1.7,
                  height: imageSize / 1.7,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(app.name,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(app.kategori),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(app.rating),
                          SizedBox(width: 4),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(app.size),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
