import 'package:flutter/widgets.dart';
import 'package:german_erp/auth/presentation/pages/auth_page.dart';
import 'package:german_erp/customer/presentation/customer_list_screen.dart';
import 'package:german_erp/customer_service/domin/customer_service_model.dart';
import 'package:german_erp/customer_service/presentation/customer_service_form_screen.dart';
import 'package:german_erp/customer_service/presentation/customer_service_list_screen.dart';
import 'package:german_erp/dashboard/pages/dashboard.dart';
import 'package:german_erp/main.dart';
import 'package:german_erp/product/presentation/product_list_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: supabase.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.session == null) {
            return const AuthPage();
          } else {
            return const CustomerServiceListScreen();
            /* CustomerServiceFormScreen(
              customer: CustomerServiceModel.empty(),
              isNew: true,
            );*/
          }
        } else {
          return const AuthPage();
        }
      },
    );
  }
}
