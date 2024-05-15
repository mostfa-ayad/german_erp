// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:german_erp/customer/domin/customer_model.dart';
import 'package:german_erp/core/widgets/app_text_field_widget.dart';
import 'package:german_erp/customer/presentation/customer_cubit/customer_cubit.dart';

class CustomerFormScreen extends StatelessWidget {
  CustomerModel customer;
  bool isNew;
  bool editeMode;
  //controllers
  GlobalKey<FormState> form = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  CustomerFormScreen({
    super.key,
    required this.customer,
    this.isNew = true,
    this.editeMode = true,
  }) {
    if (!isNew) {
      name.text = customer.name;
      description.text = customer.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CustomerCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text((isNew) ? "Create customer" : "customer id:${customer.id}"),
        actions: [
          IconButton(
              onPressed: () async {
                if (form.currentState!.validate()) {
                  customer.name = name.text;
                  customer.description = description.text;
                  if (isNew) {
                    await cubit.create(customer);
                  } else {
                    await cubit.update(customer);
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
