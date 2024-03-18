import 'package:dartz/dartz.dart';
import 'package:german_erp/global/failure.dart';
import 'package:german_erp/main.dart';

abstract class AuthDatasource {
  Future<Unit> signupWithEmailAndPassword(
      String email, String password, String userName);
  Future<Unit> signinWithEmailAndPassword(
    String email,
    String password,
  );
}

class AuthDatasourceImpl implements AuthDatasource {
  @override
  Future<Unit> signupWithEmailAndPassword(
      String email, String password, String userName) async {
    try {
      await supabase.client.auth.signUp(
          email: email, password: password, data: {"user_name": userName});
      return Future.value(unit);
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<Unit> signinWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await supabase.client.auth
          .signInWithPassword(email: email, password: password);
      return Future.value(unit);
    } on Exception catch (e) {
      throw ServerException(msg: e.toString());
    }
  }
}
