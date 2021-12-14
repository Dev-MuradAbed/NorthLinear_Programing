import 'package:flutter/material.dart';

// ignore: camel_case_types
class table extends StatefulWidget {
  const table({Key? key}) : super(key: key);

  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<table> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Table"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRowtest(),
                  TableRowtest(),
                  TableRowtest(),
                  TableRowtest(),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Total Sum= 300",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TableRow TableRowtest() {
    return TableRow(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                child: const Text(
                  "costs",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blueAccent,
              ),
            ),
            const Text("basic")
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                child: const Text(
                  "costs",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blueAccent,
              ),
            ),
            const Text("basic")
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                child: const Text(
                  "costs",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blueAccent,
              ),
            ),
            const Text("basic")
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                child: const Text(
                  "costs",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blueAccent,
              ),
            ),
            const Text("basic")
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                child: const Text(
                  "costs",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blueAccent,
              ),
            ),
            const Text("basic")
          ],
        ),
      ],
    );
  }
}
