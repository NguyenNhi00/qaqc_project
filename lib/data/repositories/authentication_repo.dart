import 'package:cha_qaqc_department_mobile_app/data/data_source/fetch_token.dart';
import 'package:cha_qaqc_department_mobile_app/data/model/user_model.dart';
import 'package:cha_qaqc_department_mobile_app/domain/repositories/authentication_repository.dart';

class AuthenticationRepoimpl implements AuthenticationRepository {
  final FetchTokenService fetchTokenService;
  AuthenticationRepoimpl(this.fetchTokenService);
  @override
  Future<UserModel> authenticate(String username, String password) async {
    return fetchTokenService.getToken(username, password);
  }
}
