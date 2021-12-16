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
  List<int>? newSupply = [];
  List<int>? newDemand = [];
  List costs = [];
  List cost1 = [];
  List? basicVariables = [];
  List? basicVariables1 = [];
  List basic1 = [];
  int total = 0;
  int numberOfBasic = 0;
  TextEditingController supplyController = TextEditingController();
  TextEditingController demandController = TextEditingController();
  TextEditingController costsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('North West'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                 supply = [];
   demand = [];
  newSupply = [];
   newDemand = [];
   costs = [];
   cost1 = [];
 basicVariables = [];
   basicVariables1 = [];
   basic1 = [];
   total = 0;
   numberOfBasic = 0;
                });
              },
              icon: const Icon(Icons.restart_alt_rounded))
        ],
        // leading: IconButton(icon: Icon(Icons.reset_tv),onPressed: (){},),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                        two(list: supply,list2: newSupply, Controller: supplyController)
                      ],
                    ),
                    Container(
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'supply values :',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '$newSupply',
                                style: const TextStyle(
                                    fontSize: 22,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'add demand value',
                          style: TextStyle(fontSize: 23),
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
                        two(list: demand,list2: newDemand, Controller: demandController)
                      ],
                    ),
                    Container(
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'demand values :',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '$newDemand',
                                style: const TextStyle(fontSize: 22),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 3,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  children: [
                    Row(
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
                        const Spacer(),
                        Row(
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
                                  cost1.add(int.parse(costsController.text));
                                  costsController.text = '';
                                  basic1.add(0);
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
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              onTap: () {
                                if (cost1.isNotEmpty) {
                                  setState(() {
                                    cost1.remove(
                                        int.parse(costsController.text));
                                    costsController.text = '';
                                    basic1.remove(0);
                                  });
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'costs values :',
                                style: TextStyle(fontSize: 18),
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
                          )
                        ],
                      ),
                    ),
                    Text(
                      '$costs',
                      style: const TextStyle(fontSize: 22),
                    ),
                    Text(
                      '$basicVariables',
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              ElevatedButton(
                  onPressed: () {
                    getTheNwc();
                    getTheTotalAmount();
                    getNumberOfBasicVariables();
                    convertSupplyAndDemand();
                    print('demand = $demand');
                    print('supply =  $supply');
                    print('new demand = $newDemand');
                    print('new supply =  $newSupply');

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => table(
                                  sup: newSupply!,
                                  dem: newDemand!,
                                  costs: costs,
                                  nwc: basicVariables,
                                  totalAmount: total,
                                  numberOfBasic: numberOfBasic,
                                )));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.5),
                    child: Text("SHOW TABLE"),
                  )),
            ],
          ),
        ),
      ),
    );
  }


  // ignore: non_constant_identifier_names
  Widget two({List? list,List? list2, TextEditingController? Controller}) {
    return Container(
      //   width:MediaQuery.of(context).size.width/2.5,
      child: Row(
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
                list2!.add(int.parse(Controller.text));
                Controller.text = '';
              });
            },
          ),
          const SizedBox(
            width: 5,
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
              if (list!.isNotEmpty) {
                setState(() {
                  list.removeLast();
                  list2!.removeLast();
                  Controller!.text = '';
                });
              }
            },
          ),
        ],
      ),
    );
  }

  void getTheNwc() {

    for (int i = 0; i < supply!.length; i++) {
      for (int j = 0; j < demand!.length; j++) {
        int x = 0;
        if (supply![i] < demand![j]) {
          setState(() {
            x = supply![i];
          });
        } else {
          setState(() {
            x = demand![j];
          });
        }

        setState(() {
          demand![j] = demand![j] - x;
          supply![i] = supply![i] - x;
          basicVariables![i][j] = x;
        });
      }
    }
  }

  void getTheTotalAmount() {
    int total_cost = 0;
    for (int i = 0; i < supply!.length; i++) {
      for (int j = 0; j < demand!.length; j++) {
        setState(() {
          total_cost =
              total_cost + (basicVariables![i][j] * costs[i][j]) as int;
        });
      }
    }
    print('Total cost = $total_cost');

    setState(() {
      total = total_cost;
    });
  }

  void getNumberOfBasicVariables() {
    int x = 0;

    for (int i = 0; i < supply!.length; i++) {
      for (int j = 0; j < demand!.length; j++) {
        if (basicVariables![i][j] > 0) {
          setState(() {
            x += 1;
          });
        }
      }
    }

    setState(() {
      numberOfBasic = x;
    });

    print(
        'the number of basic variables = ((number of supply + number of demand) -1 )');
    print('number of basic variables = $x');
  }

  void convertSupplyAndDemand() {
    setState(() {
      supply = newSupply;
      demand = newDemand;
    });
  }
}
