import 'package:flutter/material.dart';
import 'package:turf_ticker/Api/api_methods.dart';

class BodyUpcoming extends StatefulWidget {
  final List data;

  const BodyUpcoming({super.key, required this.data});

  @override
  State<BodyUpcoming> createState() => _BodyUpcomingState();
}

class _BodyUpcomingState extends State<BodyUpcoming> {
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
            trailing: GestureDetector(
              onTap: () async {
                // !ASK USER
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
                final delStat =
                    await APICalls().cancelOrder(widget.data[index]['id']);
                Navigator.of(context).pop();
                if (delStat) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Booking Deleted",
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  );
                  setState(() {
                    widget.data.removeAt(index);
                  });
                } else {
                  // !Went Wrong
                }
              },
              child: const Column(
                children: [
                  Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                  Text(
                    "CANCEL",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w900),
                  ),
                ],
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
