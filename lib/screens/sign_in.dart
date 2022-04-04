import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:report_generator/controller/sign_in_controller.dart';

import '../utils/validation.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with InputValidationMixin {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool validate = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Color(0xFF295DC0),
              ),
            ),
            Expanded(
                child: Form(
              key: formGlobalKey,
              autovalidateMode: validate
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(118.0, 50.0, 118.0, 0.0),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Hello User",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 32,
                            color: Color.fromRGBO(12, 36, 84, 0.8),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  CustomTextField(
                      controller: email,
                      labelName: "Email",
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Email is mandatory";
                        } else if (!isEmailValid(val)) {
                          return "Invalid Email Id";
                        }
                      }),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                      controller: password,
                      labelName: "Password",
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Password is mandatory";
                        } else if (!isPasswordValid(val)) {
                          return "Password minimum length  8 characters";
                        } else if (!validateStructure(val)) {
                          return "Invalid Password";
                        }
                      }),
                  SizedBox(
                    height: 4,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 300),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot password?",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.6))),
                        )),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SignInButton(
                      email: email,
                      password: password,
                      formGlobalKey: formGlobalKey)
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  SignInButton({
    Key? key,
    required this.email,
    required this.password,
    required this.formGlobalKey,
  }) : super(key: key);

  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formGlobalKey;
  SignInController signInController = SignInController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 300),
        child: GestureDetector(
          onTap: () {
            if (formGlobalKey.currentState!.validate()) {
              signInController.login(email.text, password.text, context);
              print("VALID");
            } else {
              print("INVALID");
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 45),
            decoration: BoxDecoration(
                color: Color(0xFF295DC0),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(
              "Sign In",
              style:
                  GoogleFonts.inter(textStyle: TextStyle(color: Colors.white)),
            )),
          ),
        ));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelName,
    required this.controller,
    required this.validator,
    this.inputFormatters,
  }) : super(key: key);
  final String labelName;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelName,
            style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 16, color: Colors.black)),
          ),
          SizedBox(
            height: 3,
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 300),
            child: TextFormField(
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          )
        ],
      ),
    );
  }
}
