import 'package:equatable/equatable.dart';

class GenericDropdownMenuItem<T> extends Equatable {
  final String title;
  final String? image;
  final T value;
  final bool isEnabled;
  final String? icon;

  const GenericDropdownMenuItem({
    required this.title,
    required this.value,
    this.icon,
    this.image,
    this.isEnabled = true,
  });

  @override
  List<Object?> get props => [title, image, value, isEnabled, icon];
}
