import 'package:flutter/material.dart';

class BodyFinished extends StatefulWidget {
  final List data;

  const BodyFinished({super.key, required this.data});

  @override
  State<BodyFinished> createState() => _BodyFinishedState();
}

class _BodyFinishedState extends State<BodyFinished> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) {
      return const Center(
        child: Text(
          "No Orders",
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900),
        ),
      );
    }
    return ListView.separated(
        itemBuilder: (BuildContext ctx, int index) {
          return ListTile(
            title: Text(
              widget.data[index]['slot'].toString().substring(0, 5),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              "${widget.data[index]['date']}",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext ctx, int index) {
          return const Divider();
        },
        itemCount: widget.data.length);
  }
}
