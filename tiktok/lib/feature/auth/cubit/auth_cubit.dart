import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/common/utils/shared_pref.dart';
import 'package:tiktok/feature/auth/cubit/auth_state.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  loginWithGoogle() async {
    print("Signing with google");
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // googleAuth.accessToken
      // jwt token
      /// idToken
      ///

      //  google login can be done in 2 ways.
      // 1. Completely client side(current implementation)
      // 2. Client and backend combination

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      /// dio/http:  https://www.ourapp.com/login // POST
      /// backend -> Google server,

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);

      SharedPref.setHasUserLoggedIn(true);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {}
  }

  loginWithFacebook() {}

  loginWithEmail({required String email, required String password}) async {
    print("Login up");
    print("email: $email");
    print("password: $password");

    FirebaseAuth.instance.signOut();

    try {
      emit(AuthLoadingState(loadingMessage: "Signing In"));

      final userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      SharedPref.setHasUserLoggedIn(true);

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

  logout() async {
    SharedPref.setHasUserLoggedIn(false);
    await SharedPref.clearAllData();
  }
}
