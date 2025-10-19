import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/data/repo/auth_rep.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _repo;
  late final StreamSubscription _sub;

  AuthCubit(this._repo) : super(const AuthState()) {
    _sub = _repo.onAuthStateChanged.listen((u) {
      emit(state.copyWith(user: u, loading: false, error: null));
    });
  }

  Future<void> sendOtp(String phone) async {
    emit(state.copyWith(loading: true, error: null));
    final r = await _repo.sendOtp(phone);
    if (r.left != null) {
      emit(state.copyWith(loading: false, error: r.left));
    } else {
      emit(state.copyWith(loading: false, verificationId: r.right));
    }
  }

  Future<void> verifyCode(String verificationId, String smsCode) async {
    emit(state.copyWith(loading: true, error: null));
    final r = await _repo.verifyOtp(verificationId, smsCode);
    if (r.left != null) {
      emit(state.copyWith(loading: false, error: r.left));
    } else {
      emit(state.copyWith(loading: false, user: r.right));
    }
  }

  Future<void> signOut() => _repo.signOut();

  @override
  Future<void> close() async {
    await _sub.cancel();
    return super.close();
  }
}
