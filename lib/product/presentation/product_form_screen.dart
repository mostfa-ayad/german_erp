// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:german_erp/core/widgets/app_text_field_widget.dart';
import 'package:german_erp/product/domin/product_model.dart';
import 'package:german_erp/product/presentation/product_cubit/product_cubit.dart';

class ProductFormScreen extends StatelessWidget {
  ProductModel product;
  bool isNew;
  bool editeMode;
  //controllers
  GlobalKey<FormState> form = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  ProductFormScreen({
    super.key,
    required this.product,
    this.isNew = true,
    this.editeMode = true,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text((isNew) ? "Create Product" : "Product id:${product.id}"),
        actions: [
          IconButton(
              onPressed: () async {
                if (form.currentState!.validate()) {
                  product.name = name.text;
                  product.description = description.text;
                  if (isNew) {
                    await cubit.create(product);
                  } else {
                    await cubit.update(product);
                  }
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: Form(
            key: form,
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                AppTextFieldWidget(controller: name, label: "name"),
                SizedBox(
                  height: 8.h,
                ),
                AppTextFieldWidget(
                    controller: description, label: "description")
              ],
            )),
      ),
    );
  }
}
