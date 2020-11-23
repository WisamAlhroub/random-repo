import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_before_exam/provider.dart';
import 'package:test_before_exam/users.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<User> users = Provider.of<CartModel>(context).users;
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Admin!')),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(users[index].name),
                subtitle: Column(
                  children: [
                    Text(users[index].email),
                    Text(users[index].password),
                  ],
                ),
                trailing: Consumer<CartModel>(
                  builder: (context, value, child) {
                    return IconButton(
                      icon: users[index].isAdmin
                          ? Icon(Icons.remove)
                          : Icon(Icons.add),
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .update(index);
                      },
                    );
                  },
                ));
          }),
    );
  }
}
