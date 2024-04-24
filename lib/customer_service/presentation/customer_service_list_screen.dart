import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_erp/core/widgets/show_app_snack_bar.dart';
import 'package:german_erp/customer_service/domin/customer_service_model.dart';
import 'package:german_erp/customer_service/presentation/cubit/customer_service_cubit.dart';
import 'package:german_erp/customer_service/presentation/customer_service_form_screen.dart';
import 'package:german_erp/customer_service/widgests/customer_service_card_widget.dart';

class CustomerServiceListScreen extends StatelessWidget {
  const CustomerServiceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CustomerServiceCubit>(context);
    cubit.loadList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Service List"),
      ),
      body: BlocConsumer<CustomerServiceCubit, CustomerServiceState>(
        listener: (context, state) {
          if (state is CustomerServiceActionState) {
            showAppSnackBar(context, state.msg);
            Navigator.pop(context);
          } else if (state is CustomerServiceErrorState) {
            showAppSnackBar(context, state.msg);
          }
        },
        builder: (context, state) {
          if (state is CustomerServiceListState) {
            if (state.list.isEmpty) {
              return const Center(
                child: Text("Empty List"),
              );
            } else {
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  CustomerServiceModel customerService = state.list[index];
                  return CustomerServiceCardWidget(
                      customerService: customerService);
                },
              );
            }
          } else if (state is CustomerServiceInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CustomerServiceErrorState) {
            return Center(
              child: Text("Error:- ${state.msg}"),
            );
          } else {
            return Center(
              child: Text(state.toString()),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomerServiceFormScreen(
                    isNew: true, service: CustomerServiceModel.empty()),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
