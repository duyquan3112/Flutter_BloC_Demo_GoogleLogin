import 'package:demo_bloc_gmaillogin/bloc/login_event.dart';
import 'package:demo_bloc_gmaillogin/bloc/login_state.dart';
import 'package:demo_bloc_gmaillogin/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(isUnAuthenticated()) {
    on<GoogleSignInEvent>(
      (event, emit) async {
        emit(isLoading());
        try {
          await authRepository.signInWithGoogle();
          emit(isAuthenticated());
        } catch (e) {
          emit(isError(e.toString()));
          emit(isUnAuthenticated());
        }
      },
    );

    on<SignOutEvent>((event, emit) async {
      emit(isLoading());
      await authRepository.signOut();
      emit(isUnAuthenticated());
    });
  }
}
