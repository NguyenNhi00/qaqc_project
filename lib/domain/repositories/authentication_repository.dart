import 'package:cha_qaqc_department_mobile_app/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<User> authenticate(
      String username, String password);
}
