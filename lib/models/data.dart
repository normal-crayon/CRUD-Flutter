import 'package:mongo_dart/mongo_dart.dart';

class Data {
  final ObjectId id;
  final String name;

  const Data({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'data': name,
    };
  }

  Data.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'];
}
