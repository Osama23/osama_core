import 'dart:async';

import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osama_core/osama_core.dart';

extension ContextUtils on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  TextTheme get textTheme => Theme.of(this).textTheme;

  TextDirection get textDirection => Directionality.of(this);

  // S get locale => S.of(this);

  // bool get isEn => GlobalVariables.languagePref == 'en';

  T bloc<T extends StateStreamableSource<Object?>>() =>
      BlocProvider.of<T>(this);

  Future<T?> showSnackBar<T>({
    required String message,
    SnackBarStates state = SnackBarStates.idle,
    FlashPosition position = FlashPosition.top,
    Duration? duration,
    Widget? action,
    void Function(FlashController<dynamic>)? controllerBuilder,
  }) =>
      this.showFlash<T>(
        duration: duration ?? const Duration(seconds: 3),
        builder: (_, controller) {
          controllerBuilder?.call(controller);
          return FlashBar(
            padding: EdgeInsets.zero,
            builder: (_, index) => AppSnackBar(
              message: message,
              state: state,
              actionButton: action,
            ),
            controller: controller,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              // side: BorderSide(),
            ),
            elevation: 0,
            position: position,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            clipBehavior: Clip.antiAlias,
            behavior: FlashBehavior.floating,
            content: const SizedBox(),
          );
        },
      );
}
