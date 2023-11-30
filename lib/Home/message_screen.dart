import 'package:flutter/material.dart';
import 'package:turf_ticker/Api/api_methods.dart';

class BodyMessage extends StatelessWidget {
  const BodyMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    return Center(
      child: Center(
        child: Container(
          color: Colors.grey.shade400,
          height: 400,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                minLines: 6,
                maxLines: 7,
                keyboardType: TextInputType.multiline,
                controller: messageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Message",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                  final message = messageController.text;
                  await APICalls().sendMessage(message);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Message Send SuccessFully",
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  );
                },
                child: Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "SEND",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
