import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../helpers/global.dart';
import '../../../model/product_model.dart';

class LogicController {
  Future<List<Product>> fetchProducts(String? category) async {
    try {
      var url = Uri.parse(
          "https://fakestoreapi.com/products${category == null ? '' : '/category/$category'}");

      var response = await http.get(url);
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final products =
            List.from(body).map((e) => Product.fromJson(e)).toList();

        return products;
      } else {
        log('${response.reasonPhrase}');
      }
    } on SocketException {
      showToast(msg: 'No internet connection');
    } catch (e) {
      log('catch -->> ${e.toString()}');
    }
    return [];
  }
}
