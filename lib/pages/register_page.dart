import 'package:flutter/material.dart';
import 'package:new_restaurant_app/components/my_button.dart';
import 'package:new_restaurant_app/components/my_text_field.dart';
import 'package:new_restaurant_app/services/auth/auth_service.dart';
import 'package:new_restaurant_app/themes/strings.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedPasswordController = TextEditingController();

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
              Strings.instance.litSCreateAnAccountForYou,
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
              height: 10,
            ),
            MyTextField(
                controller: confirmedPasswordController,
                hintText: Strings.instance.confirmPassword,
                obscureText: true),
            const SizedBox(
              height: 20,
            ),
            MyButton(
                onTap: () {
                  register();
                },
                text: Strings.instance.signUp),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.instance.alreadyHaveAnAccountLoginHer,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  width: 7,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(Strings.instance.loginNow,
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

  void register() async {
    final authService = AuthService();

    // check if password is match -> create user
    if (passwordController.text == confirmedPasswordController.text) {
      try {
        await authService.signUpWithEmailPassword(
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

    // if passwords don't match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(Strings.instance.passwordsDontMatch),
        ),
      );
    }
  }
}
