import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/core/theme.dart';
import 'package:whatsapp_clone/presentation/screens/chat/chat_screen.dart';
import 'package:whatsapp_clone/presentation/screens/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: ThemeMode.system,
          routes: {'/': (_) => const HomeScreen()},
          onGenerateRoute: (settings) {
            if (settings.name == '/chat') {
              final chatId = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => ChatScreen(chatId: chatId),
              );
            }
            return null;
          },
        );
      },
    );
  }
}
