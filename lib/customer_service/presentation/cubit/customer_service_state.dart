// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'customer_service_cubit.dart';

sealed class CustomerServiceState extends Equatable {
  const CustomerServiceState();

  @override
  List<Object> get props => [];
}

final class CustomerServiceInitial extends CustomerServiceState {}

class CustomerServiceListState extends CustomerServiceState {
  List<CustomerServiceModel> list;
  CustomerServiceListState({
    required this.list,
  });
}

class CustomerServiceLoading extends CustomerServiceState {}

class CustomerServiceErrorState extends CustomerServiceState {
  String msg;
  CustomerServiceErrorState({
    required this.msg,
  });
}

class CustomerServiceActionState extends CustomerServiceState {
  String msg;
  CustomerServiceActionState({
    required this.msg,
  });
}
