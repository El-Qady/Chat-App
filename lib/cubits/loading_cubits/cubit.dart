import 'package:bloc/bloc.dart';
import 'package:chat_app/cubits/loading_cubits/state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoadingCubit extends Cubit<Loading> {
  LoadingCubit() : super(NotLoadingState());
  registerUser({String? email, String? password}) async {
    emit(LoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      emit(NotLoadingState());
    } on FirebaseAuthException catch (e) {
      emit(NotLoadingState());
      rethrow; 
    } catch (e) {
      emit(NotLoadingState());
      rethrow;
    }
  }

  login({String? email, String? password}) async {
    emit(LoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      emit(NotLoadingState());
    } on FirebaseAuthException catch (e) {
      emit(NotLoadingState());
      rethrow;
    } catch (e) {
      emit(NotLoadingState());
      rethrow;
    }
  }
}
