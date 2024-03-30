// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:german_erp/core/widgets/delete_alert_dialog.dart';

import 'package:german_erp/product/domin/product_model.dart';
import 'package:german_erp/product/presentation/product_cubit/product_cubit.dart';

class ProductCard extends StatelessWidget {
  ProductModel product;
  ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductCubit>(context);
    return Padding(
      padding: EdgeInsets.only(top: 5.h, right: 8.w, left: 8.w),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5.h),
          child: Wrap(
            children: [
              Text(product.id.toString()),
              Column(
                children: [Text(product.name), Text(product.description)],
              ),
              Text(product.createdAt.toString()),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => DeleteAlertDialog(
                        onPressed: () {
                          cubit.delete(product.id);
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
