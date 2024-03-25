// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:german_erp/auth/data/datasource/auth_datasource_impl.dart';
import 'package:german_erp/core/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signupWithEmailAndPassword(
      String email, String password, String userName);
  Future<Either<Failure, Unit>> signinWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, Unit>> signout();
}
