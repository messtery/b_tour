import 'package:b_tour/bloc/user/register/register_user_bloc.dart';
import 'package:b_tour/components/custom_elevated_button.dart';
import 'package:b_tour/components/custom_link_text.dart';
import 'package:b_tour/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatelessWidget {
  Register({Key? key});

  TextEditingController namadepan = TextEditingController();
  TextEditingController namabelakang = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController katasandi = TextEditingController();
  TextEditingController ulangisandi = TextEditingController();
  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => RegisterUserBloc(),
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Form(
              key: formState,
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
                          text: "Register",
                          style: TextStyle(
                            color: Color(0xFF1CE6CD),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.person_rounded),
                    hintText: "First Name",
                    controller: namadepan,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.person_rounded),
                    hintText: "Last Name",
                    controller: namabelakang,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.person_rounded),
                    hintText: "Username",
                    controller: username,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: "Email",
                    controller: email,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.password),
                    hintText: "Password",
                    obscureText: true,
                    controller: katasandi,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.password),
                    hintText: "Re-enter password",
                    obscureText: true,
                    controller: ulangisandi,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<RegisterUserBloc, RegisterUserState>(
                      listener: (context, state) {
                        if (state is RegisterUserSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text(state.registerUserResponse.message)));
                        }
                      },
                      builder: (context, state) {
                        if (state is RegisterUserLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is RegisterWaitressError) {
                          return Center(child: Text(state.message));
                        }
                        return CustomElevatedButton(
                          onPressed: () {
                            context.read<RegisterUserBloc>().add(
                                  CreateUserEvent(
                                    username: username.text.toString(),
                                    email: email.text.toString(),
                                    isActive: true,
                                    isUser: true,
                                    firstName: namadepan.text.toString(),
                                    lastName: namabelakang.text.toString(),
                                    password1: katasandi.text.toString(),
                                    password2: ulangisandi.text.toString(),
                                  ),
                                );
                          },
                          text: "Create Account",
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 117,
                  ),
                  const CustomLinkText(text: "Existing User ?"),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      text: "Login",
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
