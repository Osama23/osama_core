extension FileUtils on String {
  String get fileName => split('/').last;

  String get fileNameWithoutExtension => split('/').last.split('.').first;

  String get fileExtension => split('/').last.split('.').last;
}
