import 'package:http/http.dart' as http;

class APICalls {
  final uri = "https://muethesimpk.pythonanywhere.com/api/";

  Future<void> login(email, password) async {
    var body = {'email': email, 'password': password};
    var url = Uri.parse('${uri}login');
    var response = await http.post(url, body: body);
    if (response.statusCode == 202) {
      // !Logged IN
    } else if (response.statusCode == 404) {
      // !No User
    } else if (response.statusCode == 401) {
      // !Wrong Password
    } else {
      // !error
    }
  }

  Future<void> signup(email, password, username, phone, name) async {
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
    print(response.statusCode);
    print(response.body);
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
    var body = {'username': 'muethesim', 'message': message};
    var response = await http.post(url, body: body);
    print(response.body);
  }
}
