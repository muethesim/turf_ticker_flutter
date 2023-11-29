import 'package:http/http.dart' as http;

class APICalls {
  final uri = "https://muethesimpk.pythonanywhere.com/api/";

  Future<void> login(email, password) async {
    var bd = {'email': email, 'password': password};
    var url = Uri.parse('${uri}login');
    var response = await http.post(url, body: bd);
    if (response.statusCode == 202) {
      // !Logged IN
      print("Logged In");
    } else if (response.statusCode == 404) {
      print("No User");
    } else if (response.statusCode == 401) {
      print("Wrong Password");
    } else {
      print("Some Error Occured!!");
    }
  }
}


// var response =
//         await http.get(url, headers: {'content-type': 'multipart/form-data'});