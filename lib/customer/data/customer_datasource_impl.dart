import 'package:dartz/dartz.dart';
import 'package:german_erp/core/failure.dart';
import 'package:german_erp/customer/data/customer_datasource.dart';
import 'package:german_erp/main.dart';
import 'package:german_erp/customer/domin/customer_model.dart';

class CustomerDatasourceImpl implements CustomerDatasource {
  String table = "customers";
  @override
  Future<Unit> delete(int id) async {
    try {
      await supabase.client.from(table).delete().match({"id": id});
      return Future.value(unit);
    } on Exception catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<List<CustomerModel>> getall() async {
    try {
      var data = await supabase.client.from(table).select();
      print(data);
      return data.map((e) => CustomerModel.fromMap(e)).toList();
    } on Exception catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<Unit> insert(CustomerModel customer) async {
    try {
      await supabase.client.from(table).insert(customer.toMap());
      return Future.value(unit);
    } on Exception catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<Unit> update(CustomerModel customer) async {
    try {
      await supabase.client
          .from(table)
          .update(customer.toMap())
          .match({"id": customer.id});
      return Future.value(unit);
    } on Exception catch (e) {
      throw ServerException(msg: e.toString());
    }
  }
}
