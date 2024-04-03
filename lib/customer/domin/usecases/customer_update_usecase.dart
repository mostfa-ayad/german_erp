// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:german_erp/customer/domin/customer_model.dart';
import 'package:german_erp/customer/domin/customer_repository.dart';
import 'package:german_erp/core/failure.dart';

class CustomerUpdateUsecase {
  CustomerRepository repository;
  CustomerUpdateUsecase({
    required this.repository,
  });
  Future<Either<Failure, Unit>> call(CustomerModel customer) async {
    return await repository.update(customer);
  }
}
