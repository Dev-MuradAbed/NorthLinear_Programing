// ignore_for_file: avoid_print

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
    super.initState();
    print(widget.sup!);
    print(widget.dem!);
    print(widget.costs!);
    print(widget.nwc!);
    print(widget.totalAmount!);
    print(widget.numberOfBasic!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Table"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Table(
                border: TableBorder.all(),
                children: [
                  firstRow(),
                  for (int i = 0; i < widget.sup!.length; i++)
                    TableRowtest(i, i, widget.sup![i]),
                  demandRow(widget.dem!),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              const Divider(
                thickness: 2,
              ),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 125),
                  child: Container(
                    //  color: Colors.blueAccent.shade400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white10.withOpacity(.8),
                          Colors.white10.withOpacity(.6),
                          Colors.white10.withOpacity(.4),
                          Colors.white10.withOpacity(.2),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(1, 1.5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "basic variables =${widget.numberOfBasic!}",
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 153),
                  child: Container(
                    //  color: Colors.blueAccent.shade400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.8),
                            Colors.white.withOpacity(0.6),
                            Colors.white.withOpacity(0.4),
                            Colors.white.withOpacity(0.1),
                          ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300.withOpacity(1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(1, 1.5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Total Sum =${widget.totalAmount!}",
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  TableRow firstRow() {
    return TableRow(children: [
      Container(
        padding: const EdgeInsets.all(18),

        // color: Colors.blueAccent,
      ),
      for (int i = 0; i < widget.dem!.length; i++)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              child: Text(
                'x${i + 1}',
                style: const TextStyle(color: Colors.black),
              ),
              // color: Colors.blueAccent,
            ),
          ],
        ),
      Container(
        padding: const EdgeInsets.only(top: 18),
        child: const Center(
          child: Text(
            'supply',
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ),
        // color: Colors.blueAccent,
      ),
    ]);
  }

  // ignore: non_constant_identifier_names
  TableRow TableRowtest(int n, int i, int s) {
    return TableRow(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 28),
          child: Center(
            child: Text(
              'a${i + 1}',
            ),
          ),
        ),
        for (int i = 0; i < widget.dem!.length; i++)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 42),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  child: Text(
                    widget.costs![n][i].toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                ),
              ),
              Text(
                widget.nwc![n][i].toString(),
              ),
            ],
          ),
        Container(
          padding: const EdgeInsets.only(top: 28),
          child: Center(
            child: Text(
              s.toString(),
            ),
          ),
        ),
      ],
    );
  }

  TableRow demandRow(List d) {
    return TableRow(children: [
      Container(
        height: MediaQuery.of(context).size.height / 12.2,
        padding: const EdgeInsets.all(7),
        child: const Center(
            child: Text(
          'demand',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        )),
      ),
      for (int i = 0; i < widget.dem!.length; i++)
        Container(
          height: MediaQuery.of(context).size.height / 12.2,
          padding: const EdgeInsets.all(7),
          child: Center(
            child: Text(
              widget.dem![i].toString(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      Container(
        height: MediaQuery.of(context).size.height / 12.2,
        padding: const EdgeInsets.all(7),
      ),
    ]);
  }
}
