import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AppWebView {

  static Widget buildAppWebView({
    required String url,
    required void Function(dynamic value, dynamic url) onStopLoading,}) {
    return InAppWebView(
      // initialUrlRequest: URLRequest(url: Uri(path: widget.videoUrl)),
      initialUrlRequest: URLRequest(url: WebUri(url)),
      onLoadStop: (value, url){
        onStopLoading(value, url);
        // setState(() {
        //   isLoading = false;
        // });
      },
    );
  }
}