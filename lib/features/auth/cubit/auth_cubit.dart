import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/data/repo/auth_rep.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _repo;
  late final StreamSubscription _sub;

  AuthCubit(this._repo) : super(const AuthState()) {
    emit(const AuthState(status: AuthStatus.loading));
    _sub = _repo.onAuthStateChanged.listen((User? u) {
      if (u == null) {
        emit(const AuthState(status: AuthStatus.unauthenticated));
      } else {
        emit(AuthState(status: AuthStatus.authenticated, user: u));
      }
    });
  }

  Future<void> login(String email, String password) async {
    emit(const AuthState(status: AuthStatus.loading));
    final err = await _repo.login(email, password);
    if (err != null) emit(AuthState(status: AuthStatus.error, message: err));
  }

  Future<void> register(String email, String password) async {
    emit(const AuthState(status: AuthStatus.loading));
    final err = await _repo.register(email, password);
    if (err != null) emit(AuthState(status: AuthStatus.error, message: err));
  }

  Future<void> resetPassword(String email) async {
    emit(const AuthState(status: AuthStatus.loading));
    final err = await _repo.sendPasswordReset(email);
    if (err != null) {
      emit(AuthState(status: AuthStatus.error, message: err));
    } else {
      emit(const AuthState(status: AuthStatus.unauthenticated));
    }
  }

  Future<void> logout() async {
    await _repo.logout();
  }

  @override
  Future<void> close() async {
    await _sub.cancel();
    return super.close();
  }
}
