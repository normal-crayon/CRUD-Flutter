import 'package:mongo_dart/mongo_dart.dart';
import '../backend.dart';
import 'package:cloud_data/models/data.dart';

class Database {
  static var db, collection;

  static connect() async {
    db = await Db.create(URI);
    await db.open();
    collection = db.collection("data");
  }

  static Future<List<Map<String, dynamic>>?> getDocs() async {
    try {
      final data = await collection.find().toList();
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static delete(Data data) async {
    await collection.remove(where.id(data.id));
  }
}
