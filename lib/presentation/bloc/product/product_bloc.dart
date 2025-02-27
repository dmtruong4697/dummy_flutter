import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namer_app/data/models/product_model.dart';
import 'package:namer_app/data/sources/remote/product_api.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductApi productApi;

  ProductBloc(this.productApi) : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    try {
      final products = await productApi.getProduct();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError("Lỗi tải danh sách sản phẩm: $e"));
    }
  }
}
