import 'package:equatable/equatable.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/user.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends LoginState {
  final bool isshow;
  final bool isUserNameError;
  final bool isPasswordError;
  InitialState(this.isshow, this.isUserNameError, this.isPasswordError);
  @override
  List<Object?> get props => [];
}

class LoginStateToggleShow extends LoginState {
  final bool isShow;
  LoginStateToggleShow(this.isShow);
  @override
  List<Object> get props => [isShow];
}

class LoginStateFormatChecking extends LoginState {
  final bool isUsernameErr;
  final bool isPasswordErr;
  LoginStateFormatChecking(this.isUsernameErr, this.isPasswordErr);
  @override
  List<Object> get props => [isUsernameErr, isPasswordErr];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginDoneState extends LoginState {
  final User user;
  LoginDoneState(this.user);
  @override
  List<Object?> get props => [user];
}
