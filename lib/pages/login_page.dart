import 'package:flutter/material.dart';
import 'package:new_restaurant_app/components/my_button.dart';
import 'package:new_restaurant_app/components/my_text_field.dart';
import 'package:new_restaurant_app/services/auth/auth_service.dart';
import 'package:new_restaurant_app/themes/strings.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            Text(
              Strings.instance.foodApp,
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
                controller: emailController,
                hintText: Strings.instance.email,
                obscureText: false),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: passwordController,
                hintText: Strings.instance.password,
                obscureText: true),
            const SizedBox(
              height: 20,
            ),
            MyButton(onTap: login, text: Strings.instance.login),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    forgetPw();
                  },
                  child: Text(
                    Strings.instance.notAMember,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(Strings.instance.registerNow,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // login method
  void login() async {
    final _authService = AuthService();

    //try sign in
    try {
      await _authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  void forgetPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("User Topped Forget Password !"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
