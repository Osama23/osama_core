import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseColoredStatusBarWidget extends StatelessWidget {
  const BaseColoredStatusBarWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 1,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        child,
      ],
    );
  }
}
