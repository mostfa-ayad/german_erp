// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:german_erp/auth/domin/repository/auth_repository.dart';
import 'package:german_erp/global/failure.dart';

class SignupWithEmailAndPasswordUsecase {
  AuthRepository repository;
  SignupWithEmailAndPasswordUsecase({
    required this.repository,
  });
  Future<Either<Failure, Unit>> call(
      String email, String password, String userName) async {
    return await repository.signupWithEmailAndPassword(
        email, password, userName);
  }
}
