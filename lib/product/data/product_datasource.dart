import 'package:dartz/dartz.dart';
import 'package:german_erp/product/domin/product_model.dart';

abstract class ProductDatasource {
  Future<Unit> insert(ProductModel product);
  Future<Unit> delete(int id);
  Future<Unit> update(ProductModel product);
  Future<List<ProductModel>> getall();
}
