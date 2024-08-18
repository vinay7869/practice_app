import 'dart:convert';
import 'package:hive/hive.dart';
import '../bloc cubit pract/model/product_model.dart';

class Pref {
  static late Box box;

  static Future<void> initializeHive() async {
    box = await Hive.openBox('data');
  }

  static set favProducts(List<Product> v) =>
      box.put('favProducts', jsonEncode(v));

  static List<Product> get favProducts {
    List<Product> temp = [];
    final data = jsonDecode(box.get('favProducts') ?? '[]');
    for (var i in data) {
      temp.add(Product.fromJson(i));
    }
    return temp;
  }
}
