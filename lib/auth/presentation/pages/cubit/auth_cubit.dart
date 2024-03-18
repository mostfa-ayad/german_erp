// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:german_erp/auth/domin/usecases/signin_with_email_and_password_usecase.dart';
import 'package:german_erp/auth/domin/usecases/signup_with_email_and_password_usecase.dart.dart';
import 'package:german_erp/main.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  SigninWithEmailAndPasswordUsecase signinWithEmailAndPassword;
  SignupWithEmailAndPasswordUsecase signupWithEmailAndPassword;
  AuthCubit(
    this.signinWithEmailAndPassword,
    this.signupWithEmailAndPassword,
  ) : super(AuthInitial());
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
