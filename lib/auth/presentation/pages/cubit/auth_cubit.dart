import 'package:bloc/bloc.dart';
import 'package:german_erp/main.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  signup(String email, String password, String name) async {
    final res = await supabase.client.auth
        .signUp(email: email, password: password, data: {"user_name": name});
  }

  signin(
    String email,
    String password,
  ) async {
    final res = await supabase.client.auth
        .signInWithPassword(email: email, password: password);
  }
}
