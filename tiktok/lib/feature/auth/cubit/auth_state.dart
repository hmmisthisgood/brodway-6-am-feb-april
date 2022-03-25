abstract class AuthState {}

// not logged in state
class AuthInitialState extends AuthState {}

// loading
class AuthLoadingState extends AuthState {
  final String loadingMessage;
  AuthLoadingState({required this.loadingMessage});
}

// error
class AuthErrorState extends AuthState {
  final String errorMessage;
  AuthErrorState({required this.errorMessage});
}

//  success
class AuthSuccessState extends AuthState {
  final data;
  AuthSuccessState({this.data});
}
