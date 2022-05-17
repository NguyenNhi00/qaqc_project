import 'package:cha_qaqc_department_mobile_app/domain/entities/user.dart';
import 'package:cha_qaqc_department_mobile_app/domain/repositories/authentication_repository.dart';

class GetUserUsecase {
  AuthenticationRepository authenticationRepository;
  GetUserUsecase(this.authenticationRepository);
  Future<User> getUser(String username, String password) async {
    final userdata = authenticationRepository.authenticate(username, password);
    return userdata;
  }
}
