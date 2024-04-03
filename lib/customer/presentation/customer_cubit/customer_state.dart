// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'customer_cubit.dart';

sealed class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}

final class CustomerInitial extends CustomerState {}

class CustomerListState extends CustomerState {
  final List<CustomerModel> list;
  const CustomerListState({
    required this.list,
  });
}

class CustomerErrorState extends CustomerState {
  final String msg;
  const CustomerErrorState({
    required this.msg,
  });
}

class CustomerActionState extends CustomerState {
  final String msg;
  const CustomerActionState({
    required this.msg,
  });
}

class CustomerDeletedState extends CustomerState {
  final String msg;
  const CustomerDeletedState({
    required this.msg,
  });
}
