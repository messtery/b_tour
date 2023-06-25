import 'package:b_tour/components/custom_elevated_button.dart';
import 'package:b_tour/components/custom_link_text.dart';
import 'package:b_tour/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24.0),
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
              const CustomTextField(
                prefixIcon: Icon(Icons.person_rounded),
                hintText: "Name",
              ),
              const SizedBox(
                height: 9,
              ),
              const CustomTextField(
                prefixIcon: Icon(Icons.person_rounded),
                hintText: "Username",
              ),
              const SizedBox(
                height: 9,
              ),
              const CustomTextField(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "Email",
              ),
              const SizedBox(
                height: 9,
              ),
              const CustomTextField(
                prefixIcon: Icon(Icons.password),
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 9,
              ),
              const CustomTextField(
                prefixIcon: Icon(Icons.password),
                hintText: "Re-enter password",
                obscureText: true,
              ),
              const SizedBox(
                height: 48,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: () {},
                  text: "Create Account",
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
    );
  }
}
