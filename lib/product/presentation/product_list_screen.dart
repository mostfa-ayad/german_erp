import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_erp/product/domin/product_model.dart';
import 'package:german_erp/product/presentation/product_cubit/product_cubit.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductListState) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                if (state.list.isNotEmpty) {
                  ProductModel product = state.list[index];
                  return Text("name : ${product.name}");
                } else {
                  return const Center(
                    child: Text("Empty List"),
                  );
                }
              },
            );
          } else if (state is ProductErrorState) {
            return Center(
              child: Text("ERROR//:${state.msg}"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
