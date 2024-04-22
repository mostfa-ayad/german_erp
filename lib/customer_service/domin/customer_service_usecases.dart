import 'package:dartz/dartz.dart';
import 'package:german_erp/core/failure.dart';
import 'package:german_erp/customer_service/domin/customer_service_model.dart';
import 'package:german_erp/customer_service/domin/customer_service_repository.dart';

class CustomerServiceGetallUsecase {
  final CustomerServiceRepository repository;

  const CustomerServiceGetallUsecase(this.repository);

  Future<Either<Failure, List<CustomerServiceModel>>> call() async {
    return await repository.getAllCustomers();
  }
}

class CustomerServiceInsertUsecase {
  final CustomerServiceRepository repository;

  const CustomerServiceInsertUsecase(this.repository);

  Future<Either<Failure, Unit>> call(CustomerServiceModel service) async {
    return await repository.insert(service);
  }
}

class CustomerServiceUpdateUsecase {
  final CustomerServiceRepository repository;

  const CustomerServiceUpdateUsecase(this.repository);

  Future<Either<Failure, Unit>> call(CustomerServiceModel service) async {
    return await repository.update(service);
  }
}

class CustomerServiceDeleteUsecase {
  final CustomerServiceRepository repository;

  const CustomerServiceDeleteUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int id) async {
    return await repository.delete(id);
  }
}
