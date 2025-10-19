import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/spacing.dart';
import 'package:whatsapp_clone/core/typography.dart';
import 'package:whatsapp_clone/features/auth/widgets/email_field.dart';
import 'package:whatsapp_clone/features/auth/widgets/password_field.dart';

import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final pass = TextEditingController();
  final pass2 = TextEditingController();

  void _show(String m) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m)));

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    pass2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.error && state.message != null) {
            _show(state.message!);
          }
          if (state.status == AuthStatus.authenticated) {
            Navigator.of(context).pushReplacementNamed('/home');
          }
        },
        builder: (context, state) {
          final loading = state.status == AuthStatus.loading;

          return Padding(
            padding: EdgeInsets.all(Spacing.md),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Join us', style: AppTypography.body),
                  SizedBox(height: Spacing.lg),

                  EmailField(
                    controller: email,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: Spacing.md),

                  PasswordField(
                    controller: pass,
                    label: 'Password (min 6 chars)',
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: Spacing.md),

                  // تأكيد الباسورد مع Validator يطابق الحقل الأول
                  PasswordField(
                    controller: pass2,
                    label: 'Confirm password',
                    textInputAction: TextInputAction.done,
                    validator: (v) {
                      final val = (v ?? '').trim();
                      if (val.isEmpty) return 'Please confirm your password';
                      if (val != pass.text.trim())
                        return 'Passwords do not match';
                      return null;
                    },
                  ),
                  SizedBox(height: Spacing.lg),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: loading
                          ? null
                          : () {
                              if (!_formKey.currentState!.validate()) return;
                              context.read<AuthCubit>().register(
                                email.text.trim(),
                                pass.text,
                              );
                            },
                      child: loading
                          ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
