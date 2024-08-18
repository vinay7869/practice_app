import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:practice_app/sql%20api/services/database/db_helper.dart';
import '../../model/product_model.dart';

class APIController {
  final dbHelper = DatabaseHelper2.internal();

  Future<List<CategoryModel>?> getCategories() async {
    try {
      var url = Uri.parse(
          'https://api.escuelajs.co/api/v1/categories?offset=0&limit=4');
      var response = await http.get(url);

      final body = jsonDecode(response.body);

      final list =
          List.from(body).map((e) => CategoryModel.fromJson(e)).toList();

      // Assuming you want to store categories in the database
      for (var category in list) {
        await dbHelper.addProduct(category.toJson());
      }
      return list;
    } catch (e) {
      log('$e');
      return null;
    }
  }

  Future<List<ProductModel>?> getCatProducts({required int id}) async {
    try {
      var url = Uri.parse(
          'https://api.escuelajs.co/api/v1/categories/$id/products?offset=0&limit=5');
      var response = await http.get(url);

      final body = jsonDecode(response.body);

      final list =
          List.from(body).map((e) => ProductModel.fromJson(e)).toList();
      return list;
    } catch (e) {
      log('$e');
      return null;
    }
  }

  // Future getSingleProduct() async {
  //   var url = Uri.parse('https://api.escuelajs.co/api/v1/products');
  //   var response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     log(response.body);
  //   } else {
  //     log('${response.reasonPhrase}');
  //   }
  // }
}
