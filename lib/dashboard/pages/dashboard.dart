import 'package:flutter/material.dart';
import 'package:german_erp/main.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Home Page"),
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
