import 'package:app_chat_fighting/service/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final Function()? onTap;
  RegisterPage({super.key, this.onTap});

  void register(BuildContext context) async {
    final authService = AuthService();
    if (confirmController.text == passController.text) {
      try {
        await authService.signUpWithEmailAndPass(
          emailController.text,
          passController.text,
        );
      } catch (e) {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("PassWord don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(
          //   Icons.location_city,
          //   size: 55,
          //   color: Theme.of(context).colorScheme.primary,
          // ),
          Lottie.asset("assets/login_animation.json", height: 300),

          Text(
            'Register',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            controller: emailController,
            obscureText: false,
            hinText: 'Select an email',
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            controller: passController,
            obscureText: true,
            hinText: 'Select an pass',
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            controller: confirmController,
            obscureText: true,
            hinText: 'confirm pass text',
          ),
          const SizedBox(
            height: 10,
          ),
          MyButton(
            text: 'Register',
            onTap: () => register(context),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You are member?',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
