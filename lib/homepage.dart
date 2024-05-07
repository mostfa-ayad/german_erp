import 'package:flutter/widgets.dart';
import 'package:german_erp/auth/presentation/pages/auth_page.dart';
import 'package:german_erp/dashboard/pages/dashboard.dart';
import 'package:german_erp/main.dart';

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
            return const Dashboard();
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
