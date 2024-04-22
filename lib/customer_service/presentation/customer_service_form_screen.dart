import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:german_erp/core/widgets/app_text_field_widget.dart';
import 'package:german_erp/customer_service/domin/customer_service_model.dart';

class CustomerServiceFormScreen extends StatelessWidget {
  const CustomerServiceFormScreen({
    super.key,
    required this.isNew,
    required this.customer,
  });

  final bool isNew;
  final CustomerServiceModel customer;

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    final name = TextEditingController(text: customer.customerName);
    final description = TextEditingController(text: customer.description);
    final phone = TextEditingController(text: customer.phone);
    final secondaryPhone = TextEditingController(text: customer.secondaryPhone);
    final address = TextEditingController(text: customer.address);
    final isComplete =
        TextEditingController(text: customer.isComplete.toString());
    final employeeName = TextEditingController(text: customer.employeeName);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            (isNew) ? "Create customer Service" : "customer id:${customer.id}"),
        actions: [
          TextButton(
            onPressed: () {
              if (form.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Customer saved")),
                );
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: Form(
          key: form,
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              AppTextFieldWidget(controller: name, label: "Customer name"),
              SizedBox(
                height: 5.h,
              ),
              AppTextFieldWidget(controller: description, label: "Description"),
              SizedBox(
                height: 5.h,
              ),
              AppTextFieldWidget(controller: phone, label: "Phone"),
              SizedBox(
                height: 5.h,
              ),
              AppTextFieldWidget(
                  controller: secondaryPhone, label: "Secondary Phone"),
              SizedBox(
                height: 5.h,
              ),
              AppTextFieldWidget(controller: address, label: "Address"),
              SizedBox(
                height: 5.h,
              ),
              AppTextFieldWidget(controller: isComplete, label: "Is Complete"),
              SizedBox(
                height: 5.h,
              ),
              AppTextFieldWidget(
                  controller: employeeName, label: "Employee Name"),
            ],
          ),
        ),
      ),
    );
  }
}
