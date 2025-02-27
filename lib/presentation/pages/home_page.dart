import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namer_app/core/network/api_client.dart';
import 'package:namer_app/data/models/product_model.dart';
import 'package:namer_app/data/sources/remote/product_api.dart';
import 'package:namer_app/domain/repositories/product_repository.dart';
import 'package:namer_app/presentation/bloc/product/product_bloc.dart';
import 'package:namer_app/presentation/bloc/product/product_event.dart';
import 'package:namer_app/presentation/bloc/product/product_state.dart';
import 'package:namer_app/presentation/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 212, 226),
        appBar: AppBar(
          title: Text(
            "Danh sách Sản phẩm",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 143, 181),
        ),
        body: BlocProvider(
          create: (context) =>
              ProductBloc(ProductApi(ApiClient()))..add(FetchProducts()),
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProductLoaded) {
                return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: state.products[index]);
                  },
                );
              } else if (state is ProductError) {
                return Center(
                    child: Text(state.message,
                        style: TextStyle(color: Colors.red)));
              }
              return Center(child: Text("Chưa có dữ liệu"));
            },
          ),
        ));
  }
}
