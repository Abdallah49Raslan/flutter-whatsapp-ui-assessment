import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/data/repo/auth_rep.dart';
import 'firebase_options.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'features/auth/cubit/auth_state.dart';
import 'features/auth/views/phone_input_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepo(FirebaseAuth.instance, FirebaseFirestore.instance)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (c) => AuthCubit(c.read<AuthRepo>())),
        ],
        child: const WhatsAppCloneApp(),
      ),
    ),
  );
}

class WhatsAppCloneApp extends StatelessWidget {
  const WhatsAppCloneApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          // لو user != null ودخّل OTP، ممكن تروح لـ Home
          if (state.user != null) {
            // TODO: غيّرها لـ HomePage لما نجهزها
            return const Scaffold(body: Center(child: Text('Logged in ✅')));
          }
          return const PhoneInputPage();
        },
      ),
    );
  }
}
