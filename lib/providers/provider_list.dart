import 'package:nkuzi_igbo/providers/app_data_provider.dart';
import 'package:nkuzi_igbo/providers/apple_auth_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'auth_provider.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<Auth>(create: (_) => Auth()),
  Provider<AppData>(
    create: (_) => AppData(),
  ),
  Provider<AuthServices>(create: (_) => AuthServices()),
];
