import 'package:camera/table_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int>? supply = [];
  List<int>? demand = [];
  List costs = [];
  List cost1 = [];
  List? basicVariables = [];
  List? basicVariables1 = [];
  List basic1 = [];
  int total = 0;
  TextEditingController supplyController = TextEditingController();
  TextEditingController demandController = TextEditingController();
  TextEditingController costsController = TextEditingController();
  TextEditingController basicVariablesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('North West'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  supply = [];
                  demand = [];
                  costs = [];
                  cost1 = [];
                  basicVariables = [];
                  basicVariables1 = [];
                  basic1 = [];
                  total = 0;
                });
              },
              icon: const Icon(Icons.restart_alt_rounded))
        ],
        // leading: IconButton(icon: Icon(Icons.reset_tv),onPressed: (){},),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   const Text(
                      'add supply value',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        width: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: supplyController,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    two(list: supply, Controller: supplyController)
                  ],
                ),
              ),
              Row(
                children: [
              const Text(
                'supply values :',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                '$supply',
                style: const TextStyle(fontSize: 22),
              ),
                ],
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'add demand value',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        width: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: demandController,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    two(list: demand, Controller: demandController)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
              const Text(
                'demand values :',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                '$demand',
                style: const TextStyle(fontSize: 22),
              ),
                ],
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'add costs value',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        width: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: costsController,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Icon(Icons.remove),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              cost1.remove(int.parse(costsController.text));
                              costsController.text = '';
                              basic1.remove(0);
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircleAvatar(
                              backgroundColor: Colors.greenAccent,
                              child: Icon(Icons.add),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              cost1.add(int.parse(costsController.text));
                              costsController.text = '';
                              basic1.add(0);
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
              const Text(
                'costs values :',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                '$cost1',
                style: const TextStyle(fontSize: 22),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      costs.add(cost1);
                      basicVariables!.add(basic1);
                      cost1 = [];
                      basic1 = [];
                    });
                  },
                  child: const Text("Add next Row"))
                ],
              ),
              Text(
                '$costs',
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                '$basicVariables',
                style: const TextStyle(fontSize: 22),
              ),
              const Divider(
                thickness: 3,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const table()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.5),
                    child: Text("SHOW TABLE"),
                  ))

              // ElevatedButton(
              //     onPressed: () {
              //       for (int i = 0; i < supply!.length; i++) {
              //         for (int j = 0; j < demand!.length; j++) {
              //           int x = 0;
              //           if (supply![i] < demand![j]) {
              //             x = supply![i];
              //           } else {
              //             x = demand![j];
              //           }
              //           demand![j] = demand![j] - x;
              //           supply![i] = supply![i] - x;
              //           basicVariables![i][j] = x;
              //         }
              //       }
              //       setState(() {
              //         basicVariables1 = basicVariables;
              //       });
              //     },
              //     child: Text("Basic")),
              // Text(
              //   '$basicVariables1',
              //   style: TextStyle(fontSize: 20),
              // ),
              // Text(
              //   '$supply',
              //   style: TextStyle(fontSize: 20),
              // ),
              // Text(
              //   '$demand',
              //   style: TextStyle(fontSize: 20),
              // ),
              // ElevatedButton(
              //     onPressed: () {
              //       int total_cost = 0;
              //       for (int i = 0; i < supply!.length; i++) {
              //         for (int j = 0; j < demand!.length; j++) {
              //           total_cost = total_cost +
              //               (basicVariables![i][j] * costs[i][j]) as int;
              //         }
              //       }
              //       setState(() {
              //         total = total_cost;
              //       });
              //     },
              //     child: Text("Sum")),
              // Text(
              //   "$total",
              //   style: TextStyle(fontSize: 20),
              // )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Row two({List? list, TextEditingController? Controller}) {
    return Row(
      children: [
        GestureDetector(
          child: const SizedBox(
            height: 30,
            width: 30,
            child: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: Icon(Icons.add),
            ),
          ),
          onTap: () {
            setState(() {
              list!.add(int.parse(Controller!.text));
              Controller.text = '';
            });
          },
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          child: const SizedBox(
            height: 30,
            width: 30,
            child: CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.remove),
            ),
          ),
          onTap: () {
            setState(() {
              list!.remove(int.parse(Controller!.text));
              Controller.text = '';
            });
          },
        ),
      ],
    );
  }
}
