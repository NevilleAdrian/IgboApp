import 'package:hive/hive.dart';

part 'app_model.g.dart';

@HiveType(typeId: 2)
class AppModel {
  @HiveField(0)
  String lastRoute;
  @HiveField(1)
  String token;

  AppModel({this.lastRoute, this.token});
}
