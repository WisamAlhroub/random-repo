import 'package:flutter/cupertino.dart';
import 'package:test_before_exam/users.dart';

class CartModel extends ChangeNotifier {
  List<User> users = [
    User(name: "Ahamd", email: "123@gmail.com", password: "123", isAdmin: true),
    User(name: "Ali", email: "456@gmail.com", password: "456", isAdmin: false),
    User(
        name: "Mohammad",
        email: "789@gmail.com",
        password: "789",
        isAdmin: false),
    User(
        name: "Faris مزكاه",
        email: "012@gmail.com",
        password: "012",
        isAdmin: false),
    User(
        name: "Yaseen",
        email: "345@gmail.com",
        password: "345",
        isAdmin: false),
    User(
        name: "Wisam", email: "678@gmail.com", password: "678", isAdmin: false),
    User(name: "Amro", email: "901@gmail.com", password: "901", isAdmin: true)
  ];

  User user;

  List<User> getUsers() {
    return this.users;
  }

  bool setUser(String newEmail, String newPassword) {
    bool isOk = false;
    this.users.forEach((element) {
      print(element.email == newEmail && element.password == newPassword);
      if (element.email == newEmail && element.password == newPassword) {
        user = element;
        notifyListeners();
        isOk = true;
      }
    });
    notifyListeners();
    return isOk;
  }

  void update(var index) {
    users[index].isAdmin = !users[index].isAdmin;
    notifyListeners();
  }
}
