import 'package:dartz/dartz.dart';
import 'package:german_erp/core/failure.dart';

abstract interface class Usecase<Type, params> {
  Future<Either<Failure, Type>> call(params);
}
