import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import 'package:test_before_exam/provider.dart';
import 'package:test_before_exam/user.page.dart';
import 'package:toast/toast.dart';

import 'admin.page.dart';

class Login extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Email is required';
                }
                return EmailValidator.validate(value)
                    ? ''
                    : "Please enter a valid email";
              },
              decoration: InputDecoration(labelText: 'Enter a email'),
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Password is required';
                }
                return '';
              },
              decoration: InputDecoration(labelText: 'Enter a password'),
            ),
            FloatingActionButton(onPressed: () {
              if (Provider.of<CartModel>(context, listen: false)
                  .setUser(emailController.text, passwordController.text)) {
                if (Provider.of<CartModel>(context, listen: false)
                    .user
                    .isAdmin) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminPage()));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserPage()));
                }
              } else {
                Toast.show('Email or password is wrong', context, duration: 3);
              }
            })
          ],
        ),
      ),
    );
  }
}
