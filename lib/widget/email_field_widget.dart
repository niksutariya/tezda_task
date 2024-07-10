import 'package:flutter/material.dart';

class EmailFieldWidget extends StatelessWidget {
  const EmailFieldWidget({super.key, required this.emailController, required this.passwordController});
final TextEditingController emailController;
final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(196, 135, 198, .3),
              ),
            ),
          ),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Email",
              hintStyle: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Password",
              hintStyle: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
          ),
        )
      ],
    );
  }
}
