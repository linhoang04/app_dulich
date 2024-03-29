import 'package:app_chat_fighting/components/my_button.dart';
import 'package:app_chat_fighting/components/my_textfield.dart';
import 'package:app_chat_fighting/service/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  final Function()? onTap;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  LoginPage({super.key, this.onTap});
  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailAndPass(
          emailController.text, passController.text);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.location_city,
            //   size: 55,
            //   color: Theme.of(context).colorScheme.primary,
            // ),
            Lottie.asset("assets/login_animation.json", height: 300),

            Text(
              'Open location',
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
              hinText: 'Your email',
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: passController,
              obscureText: true,
              hinText: 'Your pass',
            ),
            const SizedBox(
              height: 10,
            ),
            MyButton(
              text: 'Login',
              onTap: () => login(context),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
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
                    "Register now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
