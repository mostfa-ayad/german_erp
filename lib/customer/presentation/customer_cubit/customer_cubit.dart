// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:german_erp/customer/domin/customer_model.dart';
import 'package:german_erp/customer/domin/usecases/customer_delete_usecase.dart';
import 'package:german_erp/customer/domin/usecases/customer_get_all_usecase.dart';
import 'package:german_erp/customer/domin/usecases/customer_insert_usecase.dart';
import 'package:german_erp/customer/domin/usecases/customer_update_usecase.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerGetallUsecase getallUsecase;
  CustomerInsertUsecase insertUsecase;
  CustomerUpdateUsecase updateUsecase;
  CustomerDeleteUsecase deleteUsecase;
  CustomerCubit({
    required this.getallUsecase,
    required this.insertUsecase,
    required this.updateUsecase,
    required this.deleteUsecase,
  }) : super(CustomerInitial());
  loadList() async {
    emit(CustomerInitial());
    var either = await getallUsecase();
    either.fold((l) => emit(state), (r) => emit(CustomerListState(list: r)));
  }

  create(CustomerModel customer) async {
    var either = await insertUsecase(customer);
    either.fold((l) => emit(CustomerErrorState(msg: l.msg)),
        (r) => emit(const CustomerActionState(msg: "Created")));
    Future.delayed(const Duration(seconds: 1)).whenComplete(() => loadList());
  }

  update(CustomerModel Customer) async {
    var either = await updateUsecase(Customer);
    either.fold((l) => emit(CustomerErrorState(msg: l.msg)),
        (r) => emit(const CustomerActionState(msg: "Updated")));
    Future.delayed(const Duration(seconds: 1)).whenComplete(() => loadList());
  }

  delete(int id) async {
    var either = await deleteUsecase(id);
    either.fold((l) {
      emit(CustomerErrorState(msg: l.msg));
    }, (r) => emit(CustomerDeletedState(msg: "Deleted item : $id")));
    loadList();
  }
}
