import 'package:amazon_clone/core/widgets/bottom_bar.dart';
import 'package:amazon_clone/core/widgets/custom_button.dart';
import 'package:amazon_clone/core/widgets/custom_textfield.dart';
import 'package:amazon_clone/core/ui.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final AuthServices _service = AuthServices();
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void userSingUp() {
    _service.signUpUser(
      context: context,
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  void userSignIn() async {
    _service.singIn(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
    Navigator.pushNamedAndRemoveUntil(
        context, BottomBar.routeName, (route) => false);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UI.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? UI.backgroundColor
                    : UI.greyBackgroundCOlor,
                title: const Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: UI.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              _auth == Auth.signin
                  ? const SizedBox.shrink()
                  : Container(
                      color: UI.backgroundColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      child: Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _nameController,
                              hintText: "Name",
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _emailController,
                              hintText: "email@example.com",
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: "password",
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: "Sing Up",
                              onTap: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  userSingUp();
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? UI.backgroundColor
                    : UI.greyBackgroundCOlor,
                title: const Text(
                  "Sign in",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: UI.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              _auth == Auth.signup
                  ? const SizedBox.shrink()
                  : Container(
                      color: UI.backgroundColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _emailController,
                              hintText: "email@example.com",
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: "password",
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: "Sing In",
                              onTap: () {
                                if (_signInFormKey.currentState!.validate()) {
                                  userSignIn();
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
