import 'package:german_erp/core/failure.dart';
import 'package:german_erp/customer_service/data/customer_service_datasource.dart';
import 'package:german_erp/customer_service/domin/customer_service_model.dart';
import 'package:german_erp/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomerServiceDatasourceImpl implements CustomerServiceDatasource {
  static const String table = 'customer_services';
  @override
  Future<List<CustomerServiceModel>> getAll() async {
    try {
      var data = await supabase.client.from(table).select();
      supabase.client.auth.admin
          .getUserById(supabase.client.auth.currentUser!.id);
      return data.map((e) => CustomerServiceModel.fromMap(e)).toList();
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<bool> insert(CustomerServiceModel service) async {
    try {
      await supabase.client.from(table).insert(service.toMap());
      return Future.value(true);
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<bool> update(CustomerServiceModel service) async {
    try {
      await supabase.client
          .from(table)
          .update(service.toMap())
          .match({'id': service.id});
      return Future.value(true);
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<bool> delete(int id) async {
    try {
      await supabase.client.from(table).delete().match({'id': id});
      return Future.value(true);
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }
}
