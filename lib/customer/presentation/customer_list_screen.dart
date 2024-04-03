import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_erp/customer/domin/customer_model.dart';
import 'package:german_erp/core/widgets/show_app_snack_bar.dart';
import 'package:german_erp/customer/presentation/customer_cubit/customer_cubit.dart';
import 'package:german_erp/customer/presentation/customer_form_screen.dart';
import 'package:german_erp/customer/presentation/widgets/customer_card.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
      ),
      body: Center(
        child: BlocConsumer<CustomerCubit, CustomerState>(
          listener: (context, state) {
            if (state is CustomerErrorState) {
              showAppSnackBar(context, state.msg);
            } else if (state is CustomerActionState) {
              showAppSnackBar(context, state.msg);
              Navigator.pop(context);
            } else if (state is CustomerDeletedState) {
              showAppSnackBar(context, state.msg);
            }
          },
          builder: (context, state) {
            if (state is CustomerListState) {
              if (state.list.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    if (state.list.isNotEmpty) {
                      CustomerModel customer = state.list[index];
                      return CustomerCard(customer: customer);
                    } else {
                      return const Center(
                        child: Text("Empty List"),
                      );
                    }
                  },
                );
              } else {
                return const Center(
                  child: Text("Empty List"),
                );
              }
            } else if (state is CustomerErrorState) {
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomerFormScreen(
                  customer: CustomerModel.empty(),
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
