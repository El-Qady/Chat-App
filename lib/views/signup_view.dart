import 'package:chat_app/cubits/loading_cubits/cubit.dart';
import 'package:chat_app/cubits/loading_cubits/state.dart';
import 'package:chat_app/widgets/box_form_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatefulWidget {
  const SignupView({
    super.key,
  });
  static const routeName = 'Signup';

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, Loading>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoadingState,
          child: Scaffold(
            backgroundColor: const Color(0xfff8fcfd),
            appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: const Color(0xfffefeff),
                elevation: 1,
                title: Row(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 40,
                      opacity: const AlwaysStoppedAnimation(0.35),
                    ),
                    const SizedBox(width: 10),
                    const Text('Chat App',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Libertinus Serif')),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () {
                      // Handle settings action
                    },
                  )
                ]),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color.fromARGB(255, 2, 206, 228).withOpacity(0.2),
                    const Color(0xfff8fcfd).withOpacity(0.2),
                  ],
                ),
              ),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          opacity: 0.3),
                    ),
                  ),
                  Text(
                    "Chat App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Libertinus Serif',
                      color: const Color(0xff4682b4).withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Create your account to start chatting with friends",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Libertinus Serif',
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BoxFormSignup(
                    navigateToLogin: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
