

import 'dart:ui';

Color fromHex(String hex) {
  if (hex == null || hex.length < 5) return Color(255);
  Color color;
  try {
    color = Color(int.parse('ff' + hex.replaceFirst('#', ''), radix: 16));
  } catch (_) {
    color = Color(255);
  }
  return color;
}