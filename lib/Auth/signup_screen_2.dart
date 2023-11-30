import 'package:flutter/material.dart';
import 'package:turf_ticker/Api/api_methods.dart';

class ScreenSecondSignUp extends StatefulWidget {
  final String mail;
  final String password;

  const ScreenSecondSignUp(
      {super.key, required this.mail, required this.password});

  @override
  State<ScreenSecondSignUp> createState() => _ScreenSecondSignUpState();
}

class _ScreenSecondSignUpState extends State<ScreenSecondSignUp> {
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: Colors.grey,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 220, 215, 215),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28)),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28)),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28)),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: GestureDetector(
                          onTap: () async {
                            // !Sign Up
                            final username = _usernameController.text;
                            var phone = _phoneController.text;
                            var name = _nameController.text;
                            if (username == '' || phone == '' || name == '') {
                              // TODO:Fill ALL
                            } else if(phone.length < 10) {
                              // TODO:PHONE LENGTH
                            }
                            else {
                              APICalls().signup(widget.mail, widget.password,
                                  username, phone, name);
                              Navigator.popUntil(
                                  context, ModalRoute.withName('/'));
                            }
                          },
                          child: Container(
                            width: double.maxFinite,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
