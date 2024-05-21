import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'auth_textfield.dart';

class SignUpContent extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController phoneController;
  final TextEditingController newPassController;
  final TextEditingController confirmPassController;
  final GlobalKey<FormState> formKey;

  const SignUpContent(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.usernameController,
      required this.phoneController,
      required this.newPassController,
      required this.confirmPassController});

  @override
  State<SignUpContent> createState() => _SignUpContentState();
}

class _SignUpContentState extends State<SignUpContent> {
  bool obscureNewPass = true;
  bool obscureConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //  login text
        Text(
          "Sign Up",
          style: Theme.of(context).textTheme.titleMedium,
        ),

        Expanded(
          child: Form(
            key: widget.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //  login email field
                AuthTextField(
                  hintText: "Email Address",
                  controller: widget.emailController,
                  prefixIcon: Icons.email_rounded,
                  onValidate: (value) {
                    final isEmailValid = GetUtils.isEmail(value!);

                    if (!isEmailValid) {
                      return 'Enter a valid email';
                    }

                    return null;
                  },
                  onChanged: (value) {},
                ),

                AuthTextField(
                  hintText: "Username",
                  controller: widget.usernameController,
                  prefixIcon: Icons.email_rounded,
                  onValidate: (value) {},
                  onChanged: (value) {},
                ),

                AuthTextField(
                  hintText: "Phone number",
                  controller: widget.phoneController,
                  prefixIcon: Icons.phone_rounded,
                  onValidate: (value) {},
                  onChanged: (value) {},
                ),

                //  login password field
                AuthTextField(
                  hintText: "New password",
                  controller: widget.newPassController,
                  prefixIcon: Icons.key_rounded,
                  suffixIcon: obscureNewPass
                      ? Icons.visibility
                      : Icons.visibility_off_rounded,
                  isPasswordField: true,
                  obscureText: obscureNewPass,
                  onValidate: (value) {},
                  onChanged: (value) {},
                  onObscure: () {
                    setState(() {
                      obscureNewPass = !obscureNewPass;
                    });
                  },
                ),

                AuthTextField(
                  hintText: "Confirm password",
                  controller: widget.confirmPassController,
                  prefixIcon: Icons.key_rounded,
                  suffixIcon: obscureConfirmPass
                      ? Icons.visibility
                      : Icons.visibility_off_rounded,
                  obscureText: obscureConfirmPass,
                  isPasswordField: true,
                  onValidate: (value) {},
                  onChanged: (value) {},
                  onObscure: () {
                    setState(() {
                      obscureConfirmPass = !obscureConfirmPass;
                    });
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
