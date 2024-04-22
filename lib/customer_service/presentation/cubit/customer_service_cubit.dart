import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:german_erp/customer_service/domin/customer_service_model.dart';
import 'package:german_erp/customer_service/domin/customer_service_usecases.dart';

part 'customer_service_state.dart';

class CustomerServiceCubit extends Cubit<CustomerServiceState> {
  CustomerServiceInsertUsecase insertUsecase;
  CustomerServiceDeleteUsecase deleteUsecase;
  CustomerServiceGetallUsecase getallUsecase;
  CustomerServiceUpdateUsecase updateUsecase;
  CustomerServiceCubit({
    required this.insertUsecase,
    required this.deleteUsecase,
    required this.getallUsecase,
    required this.updateUsecase,
  }) : super(CustomerServiceInitial());

  Future<void> insert(CustomerServiceModel model) async {
    emit(CustomerServiceInitial());
    var result = await insertUsecase(model);
    result.fold(
      (l) => emit(CustomerServiceErrorState(msg: l.msg)),
      (r) => emit(CustomerServiceActionState(msg: "Created Successfully")),
    );
  }

  Future<void> delete(int id) async {
    emit(CustomerServiceInitial());
    var result = await deleteUsecase(id);
    result.fold(
      (l) => emit(CustomerServiceErrorState(msg: l.msg)),
      (r) => emit(CustomerServiceActionState(msg: "Deleted Successfully")),
    );
  }

  Future<void> loadList() async {
    emit(CustomerServiceInitial());
    var result = await getallUsecase();
    result.fold(
      (l) => emit(CustomerServiceErrorState(msg: l.msg)),
      (r) => emit(CustomerServiceListState(list: r)),
    );
  }

  Future<void> update(CustomerServiceModel model) async {
    emit(CustomerServiceInitial());
    var result = await updateUsecase(model);
    result.fold(
      (l) => emit(CustomerServiceErrorState(msg: l.msg)),
      (r) => emit(CustomerServiceActionState(msg: "Updated Successfully")),
    );
  }
}
