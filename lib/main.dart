import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/theme.dart';
import 'package:whatsapp_clone/data/repo/auth_rep.dart';
import 'package:whatsapp_clone/home_gate.dart';

import 'features/auth/cubit/auth_cubit.dart';
import 'features/auth/views/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AuthRepo(),
      child: BlocProvider(
        create: (c) => AuthCubit(c.read<AuthRepo>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark(), // من core/theme.dart
          darkTheme: AppTheme.light(), // من core/theme.dart
          themeMode: ThemeMode.system,
          routes: {
            '/': (_) => const LoginPage(),
            '/home': (_) => const HomeGate(), // بدّلها لما تجهّز Home الحقيقي
          },
        ),
      ),
    );
  }
}
