import 'package:hive/hive.dart';

abstract class BaseLocalDatabase<TableType> {
  final String boxName;
  late Future<Box<TableType>> boxInstance;

  BaseLocalDatabase({
    required this.boxName,
  }) {
    boxInstance = Hive.openBox(boxName);
  }

  Future<Box<TableType>> openBox() async {
    final box = await boxInstance;
    if (!box.isOpen) {
      return boxInstance;
    }
    return box;
  }

  Future<TableType?> get(String key) async {
    final Box<TableType> box = await openBox();
    return box.get(key);
  }

  Future<Map> getAll() async {
    final Box<TableType> box = await openBox();
    return box.toMap();
  }

  Future<void> put(String key, dynamic value) async {
    final Box<TableType> box = await openBox();
    return box.put(key, value);
  }

  Future<void> putAll(Map<String, TableType> items) async {
    final Box<TableType> box = await openBox();
    return box.putAll(items);
  }

  Future<void> delete(String key) async {
    final Box<TableType> box = await openBox();
    return box.delete(key);
  }

  Future<int> clearAllData() async {
    final Box<TableType> box = await openBox();
    return box.clear();
  }
}
