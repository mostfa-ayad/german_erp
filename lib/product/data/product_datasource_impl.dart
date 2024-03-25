import 'package:dartz/dartz.dart';
import 'package:german_erp/core/failure.dart';
import 'package:german_erp/main.dart';
import 'package:german_erp/product/data/product_datasource.dart';
import 'package:german_erp/product/domin/product_model.dart';

class ProductDatasourceImpl extends ProductDatasource {
  String table = "products";
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
  Future<List<ProductModel>> getall() async {
    try {
      var data = await supabase.client.from(table).select();
      print(data);
      return data.map((e) => ProductModel.fromMap(e)).toList();
    } on Exception catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<Unit> insert(ProductModel product) async {
    try {
      await supabase.client.from(table).insert(product.toMap());
      return Future.value(unit);
    } on Exception catch (e) {
      throw ServerException(msg: e.toString());
    }
  }

  @override
  Future<Unit> update(ProductModel product) async {
    try {
      await supabase.client
          .from(table)
          .update(product.toMap())
          .match({"id": product.id});
      return Future.value(unit);
    } on Exception catch (e) {
      throw ServerException(msg: e.toString());
    }
  }
}
