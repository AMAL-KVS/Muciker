import 'package:hive/hive.dart';
part 'Hive_Model.g.dart';

@HiveType(typeId: 0)
class LoacalSongs extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? artist;

  @HiveField(2)
  int? id;

  @HiveField(3)
  String? uri;

  @HiveField(4)
  int? duration;

  LoacalSongs({
    required this.title,
    required this.artist,
    required this.id,
    required this.uri,
    required this.duration,
  });
}
