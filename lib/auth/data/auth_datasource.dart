import 'package:german_erp/global/failure.dart';
import 'package:german_erp/main.dart';

class AuthDatasource {
  Future SignupWithEmailAndPassword(
      String email, String password, String userName) async {
    try {
      return await supabase.client.auth.signUp(
          email: email, password: password, data: {"user_name": userName});
    } catch (e) {
      throw ServerException(msg: e.toString());
    }
  }
}
