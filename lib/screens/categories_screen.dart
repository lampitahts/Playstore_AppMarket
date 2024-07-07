import 'package:flutter/material.dart';
import 'package:play_store_app/Components/custom_drawer_widget.dart';
import 'package:play_store_app/models/app_model.dart';

class CategoriesScreen extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesScreen({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(categories[index].name),
          leading: CircleAvatar(
            child: Icon(categories[index].iconData),
          ),
          onTap: () {
            if (categories[index].name == 'Smartwatch') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CustomDrawer(onMenuItemClicked: (item) {})),
              );
            }
          },
        );
      },
    );
  }
}
