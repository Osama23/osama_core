// This is used to rotate any widget 180 degree for Arabic UI

import 'dart:math';
import 'package:flutter/material.dart';

class MirrorWidget extends StatelessWidget {
  const MirrorWidget({
    required this.child,
    this.rotateOn,
    this.englishLangEnabled = false,
    super.key,
  });

  final Widget child;
  final Locale? rotateOn;
  final bool englishLangEnabled;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: englishLangEnabled
          ? pi
          : 0,
      child: child,
    );
  }
}
