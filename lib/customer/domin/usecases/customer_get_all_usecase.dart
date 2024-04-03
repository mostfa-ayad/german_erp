// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:german_erp/customer/domin/customer_model.dart';
import 'package:german_erp/customer/domin/customer_repository.dart';
import 'package:german_erp/core/failure.dart';

class CustomerGetallUsecase {
  CustomerRepository repository;
  CustomerGetallUsecase({
    required this.repository,
  });
  Future<Either<Failure, List<CustomerModel>>> call() async {
    return await repository.getAllCustomers();
  }
}
