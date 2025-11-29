import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:osama_core/l10n/l10n.dart';

class FileHandlerUtil {
  static Future<String> getFileSize(String url, BuildContext context) async {
    if (url.isEmpty) {
      return '';
    }
    http.Response r = await http.head(Uri.parse(url));
    var tempSize = r.headers['content-length'];
    String size = '';
    if (tempSize != null) {
      int val = int.parse(tempSize);
      if (context.mounted) {
        if (val < 1048576) {
          size = '${(val / 1024).toStringAsFixed(2)} ${context.l10n.kb}';
        } else if (val < 1073741824) {
          size = '${(val / 1048576).toStringAsFixed(2)} ${context.l10n.mb}';
        } else {
          size = '${(val / 1073741824).toStringAsFixed(2)} ${context.l10n.gb}';
        }
      }
    }
    return size;
  }
}

// enum FileType { pdf, jpg, jpeg, jpe, bmp, gif, png, doc, docx }
