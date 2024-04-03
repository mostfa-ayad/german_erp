import 'package:dartz/dartz.dart';
import 'package:german_erp/customer/domin/customer_model.dart';

abstract class CustomerDatasource {
  Future<Unit> insert(CustomerModel customer);
  Future<Unit> delete(int id);
  Future<Unit> update(CustomerModel customer);
  Future<List<CustomerModel>> getall();
}
