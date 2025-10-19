import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/auth/cubit/auth_cubit.dart';
import 'package:whatsapp_clone/features/auth/cubit/auth_state.dart';
import 'package:whatsapp_clone/features/auth/views/login_page.dart';

class HomeGate extends StatelessWidget {
  const HomeGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state.status == AuthStatus.loading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.status == AuthStatus.authenticated) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              actions: [
                IconButton(
                  tooltip: 'Logout',
                  icon: const Icon(Icons.logout),
                  onPressed: () async {
                    await context.read<AuthCubit>().logout();
                    // بعد تسجيل الخروج يرجع تلقائيًا لـ LoginPage
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                      (_) => false,
                    );
                  },
                ),
              ],
            ),
            body: const Center(child: Text('✅ Logged in — TODO: HomePage')),
          );
        }

        // حالة عدم تسجيل الدخول
        return const LoginPage();
      },
    );
  }
}
