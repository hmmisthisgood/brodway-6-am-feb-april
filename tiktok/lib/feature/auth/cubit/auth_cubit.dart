import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/feature/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit {
  AuthCubit() : super(AuthInitialState());

  loginWithGoogle() {}
  loginWithFacebook() {}

  loginWithEmail({required String email, required String password}) async {
    print("Login up");
    print("email: $email");
    print("password: $password");

    try {
      emit(AuthLoadingState(loadingMessage: "Signing In"));

      final userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(AuthSuccessState(data: userCred.user));
      print(userCred.user);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      emit(AuthErrorState(
          errorMessage: e.message ?? "An username or password is incorret"));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  signupWithEmail({required String email, required String password}) async {
    print("Singinig up");
    print("email: $email");
    print("password: $password");

    try {
      emit(AuthLoadingState(loadingMessage: "Signing Up"));

      final userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // await FirebaseAuth.instance.sendSignInLinkToEmail(
      //     email: email, actionCodeSettings: ActionCodeSettings(url: ""));

      print(userCred.user);
      emit(AuthSuccessState(data: userCred.user));
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      emit(AuthErrorState(errorMessage: e.message ?? "An error occureed"));
    } catch (e) {
      print(e);

      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }
}
