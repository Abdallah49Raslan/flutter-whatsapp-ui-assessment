import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/spacing.dart';
import 'package:whatsapp_clone/core/typography.dart';
import 'package:whatsapp_clone/features/auth/widgets/email_field.dart';
import 'package:whatsapp_clone/features/auth/widgets/password_field.dart';

import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final pass  = TextEditingController();

  void _show(String m) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m)));

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTypography.body;

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
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
                  Text('Welcome back', style: AppTypography.body),
                  SizedBox(height: Spacing.sm),
                  Text('Login with your email', style: textStyle),
                  SizedBox(height: Spacing.lg),

                  EmailField(
                    controller: email,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: Spacing.md),

                  PasswordField(
                    controller: pass,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(email.text.trim(), pass.text);
                      }
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
                              context.read<AuthCubit>().login(
                                    email.text.trim(),
                                    pass.text,
                                  );
                            },
                      child: loading
                          ? const SizedBox(
                              height: 18, width: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Login'),
                    ),
                  ),
                  SizedBox(height: Spacing.sm),

                  TextButton(
                    onPressed: () async {
                      final mail = email.text.trim();
                      if (mail.isEmpty) return _show('Enter your email first');
                      await context.read<AuthCubit>().resetPassword(mail);
                      _show('If this email exists, a reset link has been sent.');
                    },
                    child: const Text('Forgot password?'),
                  ),

                  const Spacer(),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()),
                    ),
                    child: const Text("Create new account"),
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
