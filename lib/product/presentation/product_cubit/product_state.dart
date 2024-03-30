// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

class ProductListState extends ProductState {
  final List<ProductModel> list;
  const ProductListState({
    required this.list,
  });
}

class ProductErrorState extends ProductState {
  final String msg;
  const ProductErrorState({
    required this.msg,
  });
}

class ProductActionState extends ProductState {
  final String msg;
  const ProductActionState({
    required this.msg,
  });
}

class ProductDeletedState extends ProductState {
  final String msg;
  const ProductDeletedState({
    required this.msg,
  });
}
