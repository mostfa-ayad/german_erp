// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:german_erp/customer/domin/customer_model.dart';
import 'package:german_erp/core/widgets/app_text_field_widget.dart';
import 'package:german_erp/customer/presentation/customer_cubit/customer_cubit.dart';

class CustomerFormScreen extends StatefulWidget {
  CustomerModel customer;
  bool isNew;
  bool editeMode;

  CustomerFormScreen({
    super.key,
    required this.customer,
    this.isNew = true,
    this.editeMode = true,
  });

  @override
  State<CustomerFormScreen> createState() => _CustomerFormScreenState();
}

class _CustomerFormScreenState extends State<CustomerFormScreen> {
  //controllers
  GlobalKey<FormState> form = GlobalKey();

  TextEditingController name = TextEditingController();

  TextEditingController description = TextEditingController();
  @override
  void initState() {
    if (!widget.isNew) {
      name.text = widget.customer.name;
      description.text = widget.customer.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CustomerCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text((widget.isNew)
            ? "Create customer"
            : "customer id:${widget.customer.id}"),
        actions: [
          IconButton(
              onPressed: () async {
                if (form.currentState!.validate()) {
                  widget.customer.name = name.text;
                  widget.customer.description = description.text;
                  if (widget.isNew) {
                    await cubit.create(widget.customer);
                  } else {
                    await cubit.update(widget.customer);
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
