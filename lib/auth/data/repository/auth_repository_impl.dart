import 'package:dartz/dartz.dart';
import 'package:german_erp/auth/data/datasource/auth_datasource_impl.dart';
import 'package:german_erp/auth/domin/repository/auth_repository.dart';
import 'package:german_erp/global/failure.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthDatasource datasource;
  AuthRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<Failure, Unit>> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      await datasource.signinWithEmailAndPassword(email, password);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, Unit>> signupWithEmailAndPassword(
      String email, String password, String userName) async {
    try {
      await datasource.signupWithEmailAndPassword(email, password, userName);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }

  @override
  Future<Either<Failure, Unit>> signout() async {
    try {
      await datasource.signout();
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }
}
