import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_erp/core/widgets/show_app_snack_bar.dart';
import 'package:german_erp/product/domin/product_model.dart';
import 'package:german_erp/product/presentation/product_cubit/product_cubit.dart';
import 'package:german_erp/product/presentation/product_form_screen.dart';
import 'package:german_erp/product/presentation/widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
      ),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is ProductErrorState) {
            showAppSnackBar(context, state.msg);
          } else if (state is ProductActionState) {
            showAppSnackBar(context, state.msg);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is ProductListState) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                if (state.list.isNotEmpty) {
                  ProductModel product = state.list[index];
                  return ProductCard(product: product);
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductFormScreen(
                  product: ProductModel.empty(),
                  editeMode: true,
                  isNew: true,
                ),
              ));
        },
        isExtended: true,
        child: const Icon(Icons.add),
      ),
    );
  }
}
