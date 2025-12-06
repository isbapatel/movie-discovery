// logic/auth/auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../data/services/local_storage_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LocalStorageService localStorage;

  AuthBloc(this.localStorage) : super(const AuthState()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onCheckAuthStatus(
      CheckAuthStatus event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final isLoggedIn = await localStorage.getIsLoggedIn();
    emit(state.copyWith(
        status: isLoggedIn ? AuthStatus.authenticated : AuthStatus.unauthenticated));
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    await Future.delayed(const Duration(seconds: 1)); // fake API delay

    // Simple validation: accept any non-empty email/pass for test
    if (event.email.isNotEmpty && event.password.length >= 6) {
      if (event.rememberMe) {
        await localStorage.setIsLoggedIn(true);
      }
      emit(state.copyWith(status: AuthStatus.authenticated));
    } else {
      emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'Invalid email or password'));
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    }
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    await localStorage.setIsLoggedIn(false);
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }
}
