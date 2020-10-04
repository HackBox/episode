import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final Map<String, IconData> icons_list = {
  'calendar-check': FontAwesomeIcons.calendarCheck,
  'tools': FontAwesomeIcons.tools,
  'heart': FontAwesomeIcons.heart,
  'star': FontAwesomeIcons.star,
};

extension IconDataSearchExtension on IconData {
  //search key from icons_list
  String get getFontAwesomeString =>
      icons_list.entries.firstWhere((element) => element.value == this).key;
}

extension IconDataConverterExtension on String {
  IconData get getFontAwesomeIcon {
    final icon = icons_list[this];
    if (icon == null) {
      return FontAwesomeIcons.questionCircle;
    } else {
      return icon;
    }
  }
}
