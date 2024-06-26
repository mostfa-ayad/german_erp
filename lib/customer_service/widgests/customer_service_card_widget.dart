import 'package:flutter/material.dart';
import 'package:german_erp/main.dart';

import '../../../../customer_service/domin/customer_service_model.dart';

class CustomerServiceCardWidget extends StatelessWidget {
  final CustomerServiceModel customerService;
  const CustomerServiceCardWidget({
    super.key,
    required this.customerService,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          title: Text(customerService.customerName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                customerService.phone,
              ),
              Text(
                customerService.address,
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              /* showDialog(
                context: context,
                builder: (context) => DeleteAlertDialog(
                  onPressed: () {
                    context
                        .read<CustomerServiceCubit>()
                        .delete(customerService.id);
                  },
                ),
              );*/
            },
          ),
        ),
      ),
    );
  }
}
