// lib/features/auth/cubit/auth_state.dart
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthState extends Equatable {
  final bool loading;
  final String? verificationId;
  final User? user;
  final String? error;

  const AuthState({
    this.loading = false,
    this.verificationId,
    this.user,
    this.error,
  });

  AuthState copyWith({
    bool? loading,
    String? verificationId,
    User? user,
    String? error,
  }) => AuthState(
        loading: loading ?? this.loading,
        verificationId: verificationId ?? this.verificationId,
        user: user ?? this.user,
        error: error,
      );

  @override
  List<Object?> get props => [loading, verificationId, user, error];
}
