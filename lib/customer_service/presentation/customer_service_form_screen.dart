import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:german_erp/core/widgets/app_text_field_widget.dart';
import 'package:german_erp/customer_service/domin/customer_service_model.dart';
import 'package:german_erp/customer_service/presentation/cubit/customer_service_cubit.dart';

class CustomerServiceFormScreen extends StatelessWidget {
  CustomerServiceFormScreen({
    super.key,
    required this.isNew,
    required this.service,
  }) {
    if (!isNew) {
      name.text = service.customerName;
      phone.text = service.phone;
      secondaryPhone.text = service.secondaryPhone;
      address.text = service.address;
      description.text = service.description;
      isComplete.text = service.isComplete.toString();
    }
  }
  final form = GlobalKey<FormState>();
  final name = TextEditingController();
  final description = TextEditingController();
  final phone = TextEditingController();
  final secondaryPhone = TextEditingController();
  final address = TextEditingController();
  final isComplete = TextEditingController();
  final employeeName = TextEditingController();

  final bool isNew;
  CustomerServiceModel service;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CustomerServiceCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            (isNew) ? "Create customer Service" : "service id:${service.id}"),
        actions: [
          TextButton(
            onPressed: () {
              if (form.currentState!.validate()) {
                service = service.copyWith(
                  customerName: name.text,
                  phone: phone.text,
                  secondaryPhone: secondaryPhone.text,
                  address: address.text,
                  description: description.text,
                  isComplete: isComplete.text == "true",
                  employeeName: employeeName.text,
                );

                if (isNew) {
                  cubit.insert(service);
                } else {
                  cubit.update(service);
                }
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
              AppTextFieldWidget(
                controller: name,
                label: "Customer name",
                required: true,
              ),
              SizedBox(
                height: 5.h,
              ),
              AppTextFieldWidget(
                controller: phone,
                label: "Phone",
                required: true,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 5.h,
              ),
              AppTextFieldWidget(
                controller: secondaryPhone,
                label: "Secondary Phone",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 5.h,
              ),
              AppTextFieldWidget(
                controller: address,
                label: "Address",
                required: true,
              ),
              SizedBox(
                height: 5.h,
              ),
              AppTextFieldWidget(
                  controller: employeeName, label: "Employee Name"),
              SizedBox(
                height: 5.h,
              ),
              AppTextFieldWidget(
                controller: description,
                label: "Description",
                required: true,
                lines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
