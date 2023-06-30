import 'package:b_tour/bloc/user/login/login_user_bloc.dart';
import 'package:b_tour/components/custom_elevated_button.dart';
import 'package:b_tour/components/custom_link_text.dart';
import 'package:b_tour/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final formStateLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginUserBloc(),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Form(
              key: formStateLogin,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage('assets/images/logo.png'),
                          width: 193,
                          height: 173,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: Color(0xFF1CE6CD),
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: "Email/Username",
                    controller: username,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.password),
                    hintText: "Password",
                    obscureText: true,
                    controller: password,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<LoginUserBloc, LoginUserState>(
                      listener: (context, state) {
                        if (state is LoginUserSuccess) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/home',
                            (route) => false,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginUserLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is LoginUserError) {
                          return Center(child: Text(state.message));
                        }
                        return CustomElevatedButton(
                          onPressed: () {
                            context.read<LoginUserBloc>().add(
                                  LoggedInUserEvent(
                                    username: username.text.toString(),
                                    password: password.text.toString(),
                                  ),
                                );
                          },
                          text: "Login",
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 117,
                  ),
                  const CustomLinkText(text: "New User ?"),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      text: "Register",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
