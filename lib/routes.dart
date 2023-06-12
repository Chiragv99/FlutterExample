import 'package:flutter/widgets.dart';
import 'package:flutterapi/classes/setting.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  Setting.routeName: (context) => const Setting(),

};
