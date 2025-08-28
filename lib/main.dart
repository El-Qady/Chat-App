import 'package:chat_app/cubits/loading_cubits/cubit.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatAPP());
}

class ChatAPP extends StatelessWidget {
  const ChatAPP({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadingCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        routes: {
          LoginView.routeName: (context) => const LoginView(),
          SignupView.routeName: (context) => const SignupView(),
          ChatView.routeName: (context) => ChatView(),
        },
        home: const LoginView(),
      ),
    );
  }
}
