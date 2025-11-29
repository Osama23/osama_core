import 'package:flutter/material.dart';

extension WidgetListUtils on List<Widget> {
  List<Widget> addSeparator(Widget separator, [int stopAt = 1]) {
    final List<Widget> newList = [];
    if(length <= 1) return this;
    for(int i = 0; i < length; i++) {
      newList.add(this[i]);
      if(i < length - stopAt) {
        newList.add(separator);
      }
    }
    return newList;
  }
}