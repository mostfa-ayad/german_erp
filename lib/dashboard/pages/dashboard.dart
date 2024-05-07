import 'package:flutter/material.dart';
import 'package:german_erp/customer/presentation/customer_list_screen.dart';
import 'package:german_erp/customer_service/presentation/customer_service_list_screen.dart';
import 'package:german_erp/dashboard/widgets/navigator_widget.dart';
import 'package:german_erp/main.dart';
import 'package:german_erp/product/presentation/product_list_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Home Page"),
            Wrap(
              children: [
                NavigatorWidget(
                    title: "customer", screen: const CustomerListScreen()),
                NavigatorWidget(
                    title: "customer service",
                    screen: const CustomerServiceListScreen()),
                NavigatorWidget(
                    title: "product", screen: const ProductListScreen())
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  await supabase.client.auth.signOut();
                },
                child: const Text("Log out"))
          ],
        ),
      ),
    );
  }
}
