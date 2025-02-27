import 'package:dio/dio.dart';
import 'package:namer_app/core/network/api_client.dart';
import 'package:namer_app/core/network/api_endpoints.dart';
import 'package:namer_app/data/models/product_model.dart';

class ProductApi {
  final ApiClient apiClient;

  ProductApi(this.apiClient);

  Future<List<ProductModel>> getProduct() async {
    try {
      Response response = await apiClient.get(ApiEndpoints.products);

      if (response.data is Map<String, dynamic> && response.data.containsKey("products")) {
        List<dynamic> productsJson = response.data["products"] as List<dynamic>;
        return productsJson.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw Exception("API không trả về danh sách sản phẩm hợp lệ");
      }
    } catch (e) {
      throw Exception("Lỗi lấy danh sách sản phẩm: $e");
    }
  }
}
