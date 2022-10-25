import 'package:hive_flutter/hive_flutter.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String desc;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final int id;

  NoteModel({
    required this.name,
    required this.title,
    required this.desc,
    this.id = 0,
  });
}
