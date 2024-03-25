// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:german_erp/product/domin/product_model.dart';

class ProductCard extends StatelessWidget {
  ProductModel product;
  ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h, right: 8.w, left: 8.w),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.id.toString()),
              Column(
                children: [Text(product.name), Text(product.description)],
              ),
              Text(product.createdAt.toString()),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
