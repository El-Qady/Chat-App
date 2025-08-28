import 'package:chat_app/cubits/loading_cubits/cubit.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoxFormSignup extends StatelessWidget {
  BoxFormSignup({
    super.key,
    required this.navigateToLogin,
  });
  Function() navigateToLogin;
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xfff7fcfd).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: TextFormField(
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
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xfff7fcfd).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: TextFormField(
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
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    await context
                        .read<LoadingCubit>()
                        .registerUser(email: email!, password: password!);
                    Navigator.pushReplacementNamed(context, ChatView.routeName,arguments: email);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      showSnackBar(context, 'Password is too weak.', true);
                    } else if (e.code == 'email-already-in-use') {
                      showSnackBar(context,
                          'The account already exists for that email.', true);
                    } else if (e.code == 'invalid-email') {
                      showSnackBar(
                          context, 'The email address is not valid.', true);
                    }
                  } catch (e) {
                    showSnackBar(context, 'An error occurred.', true);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xffa7dce7),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Create Account',
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
                  'Already have an account?',
                ),
                TextButton(
                  onPressed: navigateToLogin,
                  child: const Text(
                    'Sign in',
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

  void showSnackBar(BuildContext context, String message,
      [bool error = false]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: error ? Colors.redAccent : Colors.green,
        content: Text(message),
      ),
    );
  }
}
