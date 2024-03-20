// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

@immutable
class AuthCubitState {}

final class AuthInitial extends AuthCubitState {}

class AuthErrorState extends AuthCubitState {
  final String msg;
  AuthErrorState({
    required this.msg,
  });
}

class AuthLoadingState extends AuthCubitState {}

class AuthSuccessLogin extends AuthCubitState {}
