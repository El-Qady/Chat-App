import 'package:chat_app/cubits/loading_cubits/cubit.dart';
import 'package:chat_app/cubits/loading_cubits/state.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:chat_app/widgets/box_form_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });
  static const routeName = 'Login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, Loading>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoadingState,
          child: Scaffold(
            backgroundColor: const Color(0xfff8fcfd),
            appBar: AppBar(
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
            body: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                // Container(
                //   height: 90,
                //   width: 90,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15),
                //     color: const Color(0xffa2dae8),
                //     image: const DecorationImage(
                //       image: AssetImage('assets/images/user.png'),
                //       scale: 1.5,
                //     ),
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffa2dae8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.only(top: 10),
                      child: Image.asset(
                        "assets/images/user.png",
                        scale: 1.5,
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Welcom Back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Libertinus Serif',
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Sign in to continue chatting",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Libertinus Serif',
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                BoxFormLogin(
                  navigateToLogin: () {
                    Navigator.pushNamed(context, SignupView.routeName);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
