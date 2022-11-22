extension EnumExtension on Enum {
  String get abbreviate => '${name[0].toUpperCase()}${name[1]}';

  String get capitalize => '${name[0].toUpperCase()}${name.substring(1)}';
}
