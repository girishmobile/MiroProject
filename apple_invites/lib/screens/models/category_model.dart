import 'package:uuid/uuid.dart';

final uuid = Uuid();

class CategoryModel {
  final String id;
  final String name;
  CategoryModel({required this.name}) : id = uuid.v4();
}
