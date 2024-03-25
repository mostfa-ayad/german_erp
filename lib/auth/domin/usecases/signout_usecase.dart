// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:german_erp/auth/domin/repository/auth_repository.dart';
import 'package:german_erp/core/failure.dart';

class SignoutUsecase {
  AuthRepository repository;
  SignoutUsecase({
    required this.repository,
  });
  Future<Either<Failure, Unit>> call() async {
    return await repository.signout();
  }
}
