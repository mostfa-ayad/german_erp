// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:german_erp/auth/domin/repository/auth_repository.dart';
import 'package:german_erp/core/failure.dart';

class SigninWithEmailAndPasswordUsecase {
  AuthRepository repository;
  SigninWithEmailAndPasswordUsecase({
    required this.repository,
  });
  Future<Either<Failure, Unit>> call(String email, String password) async {
    return await repository.signinWithEmailAndPassword(email, password);
  }
}
