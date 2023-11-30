import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APICalls {
  final uri = "https://muethesimpk.pythonanywhere.com/api/";

  login(email, password) async {
    var body = {'email': email, 'password': password};
    var url = Uri.parse('${uri}login');
    var response = await http.post(url, body: body);
    if (response.statusCode == 202) {
      var jsonResponse = jsonDecode(response.body);
      final preferences = await SharedPreferences.getInstance();
      try {
        preferences.setStringList('user', <String>[
          jsonResponse['email'],
          jsonResponse['username'],
          jsonResponse['name'],
          jsonResponse['phone'],
        ]);
        print(preferences.getStringList('user'));
      } catch (err) {
        print(err);
      }
      // print("SET${preferences.getString('email')!}");
      return 1;
    } else if (response.statusCode == 404) {
      return -1;
    } else if (response.statusCode == 401) {
      return 0;
    } else {
      return -2;
    }
  }

  signup(email, password, username, phone, name) async {
    print(username);
    var body = {
      'email': email,
      'username': username,
      'password1': password,
      'password2': password,
      'name': name,
      'phone': phone
    };
    var url = Uri.parse('${uri}register');
    var response = await http.post(url, body: body);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  checkMail(email) async {
    var url = Uri.parse('${uri}check-email');
    var body = {'email': email};
    var response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      return false;
    } else {
      // !Raise An Exception
    }
  }

  sendMessage(message) async {
    var url = Uri.parse('${uri}message');
    final preferences = await SharedPreferences.getInstance();
    final username = preferences.getStringList('user')![1];
    var body = {'username': username, 'message': message};
    var response = await http.post(url, body: body);
    if (response.statusCode == 201) {
      return true;
      // !Remind User
    } else {
      return false;
    }
  }

  getSlots(date) async {
    var dt = date.toString();
    dt = dt.substring(0, 10);
    var url = Uri.parse('${uri}check-slot?$dt');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      return [];
    }
  }

  bookSlot(date, slot) async {
    var url = Uri.parse('${uri}book-slot');
    final preferences = await SharedPreferences.getInstance();
    final username = preferences.getStringList('user')![1];

    var body = {
      'username': username,
      'date': date.toString().substring(0, 10),
      'slot': slot,
      'paymentId': 'pId'
    };
    var response = await http.post(url, body: body);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  viewUserSlots() async {
    var url = Uri.parse('${uri}view-slot');
    final preferences = await SharedPreferences.getInstance();
    final username = preferences.getStringList('user')![1];
    var body = {'username': username};
    var response = await http.post(url, body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      return [];
    }
  }

  cancelOrder(id) async {
    var url = Uri.parse('${uri}cancel-slot');
    final preferences = await SharedPreferences.getInstance();
    final username = preferences.getStringList('user')![1];
    var body = {'username': username, 'bookingId': id.toString()};
    var response = await http.post(url, body: body);
    if (response.statusCode == 202) {
      return true;
    } else {
      return false;
    }
  }
}
