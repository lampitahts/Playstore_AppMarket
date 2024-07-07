
import 'package:flutter/material.dart';

class ColorProvider extends InheritedWidget {
  final Color color;
  final Function(Color) onColorChanged;

  ColorProvider({
    required this.color,
    required this.onColorChanged,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant ColorProvider oldWidget) {
    return oldWidget.color != color;
  }

  static ColorProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorProvider>();
  }
}
