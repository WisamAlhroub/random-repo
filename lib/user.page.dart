import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_before_exam/provider.dart';
import 'package:test_before_exam/users.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<CartModel>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome! ${user.name}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text("Name: ${user.name}"),
                trailing: Column(
                  children: [
                    Text("Email: ${user.email}"),
                    Text("Password: ${user.password}")
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
