import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AppData {
  String _lastRoute;
  String get lastRoute => _lastRoute;
  setLastRoute(String route) => _lastRoute = route;

  static AppData appDataProvider(BuildContext context, {bool listen = false}) =>
      Provider.of<AppData>(context, listen: listen);
}
