// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:german_erp/product/domin/product_model.dart';

import 'package:german_erp/product/domin/usecases/product_get_all_usecase.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductGetallUsecase getallUsecase;
  ProductCubit(
    this.getallUsecase,
  ) : super(ProductInitial());
  loadList() async {
    emit(ProductInitial());
    var either = await getallUsecase.call();
    either.fold((l) => emit(state), (r) => emit(ProductListState(list: r)));
  }
}
