import 'package:german_erp/customer_service/domin/customer_service_model.dart';

/// A contract that defines the methods for a [CustomerServiceDatasource].
abstract class CustomerServiceDatasource {
  /// Retrieves all customers from the data source.
  ///
  /// Returns a [Future] that completes with a list of [Customer] objects.
  Future<List<CustomerServiceModel>> getAll();

  /// Inserts a customer into the data source.
  ///
  /// The [customer] parameter is the customer object to be inserted.
  ///
  /// Returns a [Future] that completes with a boolean value indicating
  /// whether the insertion was successful or not.
  Future<bool> insert(CustomerServiceModel service);

  /// Updates a customer in the data source.
  ///
  /// The [customer] parameter is the customer object to be updated.
  ///
  /// Returns a [Future] that completes with a boolean value indicating
  /// whether the update was successful or not.
  Future<bool> update(CustomerServiceModel service);

  /// Deletes a customer from the data source.
  ///
  /// The [id] parameter is the ID of the customer to be deleted.
  ///
  /// Returns a [Future] that completes with a boolean value indicating
  /// whether the deletion was successful or not.
  Future<bool> delete(int id);
}
