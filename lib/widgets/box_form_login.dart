import 'package:chat_app/cubits/loading_cubits/cubit.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoxFormLogin extends StatefulWidget {
  const BoxFormLogin({super.key, required this.navigateToLogin});
  final Function() navigateToLogin;

  @override
  State<BoxFormLogin> createState() => _BoxFormLoginState();
}

class _BoxFormLoginState extends State<BoxFormLogin> {
  bool rememberMe = false;
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xfffdfefe),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            TextFormField(
              validator: (data) {
                if (data!.isEmpty) {
                  return 'Enter an email';
                }
                return null;
              },
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (data) {
                if (data!.isEmpty) {
                  return 'Enter a password';
                }
                return null;
              },
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value ?? false;
                    });
                  },
                ),
                const Text(
                  'Remember me',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Handle forgot password action
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff90d2ed),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    await context.read<LoadingCubit>().login(
                          email: email!,
                          password: password!,
                        );
                    Navigator.pushNamed(context, ChatView.routeName,
                        arguments: email);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      showSnackBar(context, 'No user found for that email');

                    } else if (e.code == 'wrong-password') {
                      showSnackBar(
                          context, 'Wrong password provided for that user.');
                    } else if (e.code == 'invalid-email') {
                      showSnackBar(context, 'The email address is not valid.');
                    } else if (e.code == 'too-many-requests') {
                      showSnackBar(context,
                          'Too many attempts to sign in as this user.');
                    } else if (e.code == 'missing-email') {
                      showSnackBar(context, 'Please enter your email address.');
                    }
                  } catch (e) {
                    showSnackBar(context, e.toString());
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xffa5dbe7),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Sign In',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                ),
                TextButton(
                  onPressed: widget.navigateToLogin,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff90d2ed),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message, [bool error = true]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: error ? Colors.redAccent : Colors.green,
      content: Text(message),
    ));
  }
}
