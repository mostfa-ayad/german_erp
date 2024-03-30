// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:german_erp/product/domin/product_model.dart';
import 'package:german_erp/product/domin/usecases/product_delete_usecase.dart';
import 'package:german_erp/product/domin/usecases/product_get_all_usecase.dart';
import 'package:german_erp/product/domin/usecases/product_insert_usecase.dart';
import 'package:german_erp/product/domin/usecases/product_update_usecase.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductGetallUsecase getallUsecase;
  ProductInsertUsecase insertUsecase;
  ProductUpdateUsecase updateUsecase;
  ProductDeleteUsecase deleteUsecase;
  ProductCubit({
    required this.getallUsecase,
    required this.insertUsecase,
    required this.updateUsecase,
    required this.deleteUsecase,
  }) : super(ProductInitial());
  loadList() async {
    emit(ProductInitial());
    var either = await getallUsecase();
    either.fold((l) => emit(state), (r) => emit(ProductListState(list: r)));
  }

  create(ProductModel product) async {
    var either = await insertUsecase(product);
    either.fold((l) => emit(ProductErrorState(msg: l.msg)),
        (r) => emit(const ProductActionState(msg: "Created")));
    Future.delayed(const Duration(seconds: 1)).whenComplete(() => loadList());
  }

  update(ProductModel product) async {
    var either = await updateUsecase(product);
    either.fold((l) => emit(ProductErrorState(msg: l.msg)),
        (r) => emit(const ProductActionState(msg: "Updated")));
    Future.delayed(const Duration(seconds: 1)).whenComplete(() => loadList());
  }

  delete(int id) async {
    var either = await deleteUsecase(id);
    either.fold((l) {
      emit(ProductErrorState(msg: l.msg));
    }, (r) => emit(ProductDeletedState(msg: "Deleted item : $id")));
    loadList();
  }
}
