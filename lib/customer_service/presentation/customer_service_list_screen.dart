import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_erp/customer_service/domin/customer_service_model.dart';
import 'package:german_erp/customer_service/presentation/cubit/customer_service_cubit.dart';
import 'package:german_erp/customer_service/widgests/customer_service_card_widget.dart';

class CustomerServiceListScreen extends StatelessWidget {
  const CustomerServiceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Service List"),
      ),
      body: BlocBuilder<CustomerServiceCubit, CustomerServiceState>(
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
    );
  }
}
