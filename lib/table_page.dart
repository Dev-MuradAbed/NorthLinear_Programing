import 'package:flutter/material.dart';

// ignore: camel_case_types
class table extends StatefulWidget {
  const table({
    Key? key,
    required this.sup,
    required this.dem,
    required this.costs,
    required this.nwc,
    required this.totalAmount,
    required this.numberOfBasic,
  }) : super(key: key);
  final List? sup;
  final List? dem;

  final List? costs;
  final List? nwc;
  final int? totalAmount;
  final int? numberOfBasic;

  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<table> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.sup!);
    print(widget.dem!);
    print(widget.costs!);
    print(widget.nwc!);
    print(widget.totalAmount!);
    print(widget.numberOfBasic!);
    print(widget.dem!.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Table"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 325,
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      for (int i = 0; i < widget.sup!.length; i++)
                      
                        TableRowtest(i),
                      demandRow(widget.dem!),
                    ],
                  ),
                ),
                tableColumn(widget.sup!),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            const Divider(
              thickness: 2,
            ),
            Text(
              "Total Sum= ${widget.totalAmount!}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 80,
            ),
            const Divider(
              thickness: 2,
            ),
            Text(
              "number of basic variables= ${widget.numberOfBasic!}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TableRow TableRowtest(int n) {
    return TableRow(
      children: [
        for (int i = 0; i < widget.dem!.length; i++)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  child: Text(
                    widget.costs![n][i].toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                ),
              ),
              Text(
                widget.nwc![n][i].toString(),
              ),
            ],
          ),
      ],
    );
  }

  TableRow demandRow(List d) {
    return TableRow(children: [
      for (int i = 0; i < widget.dem!.length; i++)
        Container(
          height: MediaQuery.of(context).size.height / 12.2,
          padding: const EdgeInsets.all(7),
          child: Center(
            child: Text(
              widget.dem![i].toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
    ]);
  }



  Widget tableColumn(List col) {
    return Column(
      children: [
        for (int i = 0; i < col.length; i++)
          Container(
            height: MediaQuery.of(context).size.height / 12.2,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
            ),
            child: Center(child: Text(widget.sup![i].toString())),
          ),
        Container(
          height: MediaQuery.of(context).size.height / 12.2,
          width: MediaQuery.of(context).size.width / 10,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5),
          ),
        ),
      ],
    );
  }
}
