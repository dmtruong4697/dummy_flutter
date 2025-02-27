import 'package:namer_app/data/models/product_model.dart';
import 'package:namer_app/data/sources/remote/product_api.dart';

class ProductRepository {
  final ProductApi productApi;
  ProductRepository(this.productApi);

    Future<List<ProductModel>> getProducts() async {
    return await productApi.getProduct();
  }
}
