// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:german_erp/core/widgets/app_text_widget.dart';
import 'package:german_erp/core/widgets/delete_alert_dialog.dart';

import 'package:german_erp/customer/domin/customer_model.dart';
import 'package:german_erp/customer/presentation/customer_cubit/customer_cubit.dart';

class CustomerCard extends StatelessWidget {
  CustomerModel customer;
  CustomerCard({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CustomerCubit>(context);
    return Padding(
      padding: EdgeInsets.only(top: 5.h, right: 8.w, left: 8.w),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(child: Text(customer.id.toString())),
              AppTextWidget(
                fontWeight: FontWeight.bold,
                text: customer.name,
              ),
              AppTextWidget(text: customer.description),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => DeleteAlertDialog(
                        onPressed: () {
                          cubit.delete(customer.id);
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
