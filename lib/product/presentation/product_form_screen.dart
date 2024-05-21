// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:german_erp/core/widgets/app_text_field_widget.dart';
import 'package:german_erp/product/domin/product_model.dart';
import 'package:german_erp/product/presentation/product_cubit/product_cubit.dart';

class ProductFormScreen extends StatefulWidget {
  ProductModel product;
  bool isNew;
  bool editeMode;

  ProductFormScreen({
    super.key,
    required this.product,
    this.isNew = true,
    this.editeMode = true,
  });

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  //controllers
  GlobalKey<FormState> form = GlobalKey();

  TextEditingController name = TextEditingController();

  TextEditingController description = TextEditingController();
  @override
  void initState() {
    if (!widget.isNew) {
      name.text = widget.product.name;
      description.text = widget.product.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text((widget.isNew)
            ? "Create Product"
            : "Product id:${widget.product.id}"),
        actions: [
          IconButton(
              onPressed: () async {
                if (form.currentState!.validate()) {
                  widget.product.name = name.text;
                  widget.product.description = description.text;
                  if (widget.isNew) {
                    await cubit.create(widget.product);
                  } else {
                    await cubit.update(widget.product);
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
