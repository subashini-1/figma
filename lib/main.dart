import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

// Changed only this: converted to StatefulWidget
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> trucks = [];
  final TextEditingController truckNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedTier;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.phone),
              label: Text("Help"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: StadiumBorder(side: BorderSide(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 50,
                          ),
                        ),
                        Text(
                          "Hello",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          color: Colors.yellow,
                          child: Text(
                            "UNVERIFIED",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Raguvaran Kanth Kumareshan ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 400.0,
                      height: 200.0,
                      child: Card(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Verify Your KYC',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "lorem ipsum is a simple dumm",
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(height: 40),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        color: Colors.blue,
                                        child: Text(
                                          "Verify Now",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "My Trucks",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(40),
                                    ),
                                  ),
                                  builder: (context) => Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(
                                        context,
                                      ).viewInsets.bottom,
                                      left: 16,
                                      right: 16,
                                      top: 20,
                                    ),
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Add Truck",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          TextFormField(
                                            controller: truckNumberController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "Truck Number",
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.trim().isEmpty) {
                                                return 'Truck number is required';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(height: 12),
                                          TextFormField(
                                            controller: descriptionController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "Description",
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.trim().isEmpty) {
                                                return 'Description is required';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(height: 16),
                                          DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "Tier",
                                            ),
                                            value: selectedTier,
                                            items: [
                                              DropdownMenuItem(
                                                value: "No Plan",
                                                child: Text("No Plan"),
                                              ),
                                              DropdownMenuItem(
                                                value: "Silver",
                                                child: Text("Silver"),
                                              ),
                                              DropdownMenuItem(
                                                value: "Gold",
                                                child: Text("Gold"),
                                              ),
                                            ],
                                            onChanged: (String? value) {
                                              setState(() {
                                                selectedTier = value;
                                              });
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.trim().isEmpty) {
                                                return 'Select the tier';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(height: 25),
                                          DottedBorder(
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Truck",
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                    Text(
                                                      "lorem ipsum is a simple dumm",
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text("Upload +"),
                                                      style:
                                                          ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                Colors.blueGrey,
                                                            foregroundColor:
                                                                Colors.black,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 28,
                                                        backgroundColor:
                                                            Colors.blueGrey,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          ElevatedButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  trucks.add({
                                                    "number":
                                                        truckNumberController
                                                            .text,
                                                    "description":
                                                        descriptionController
                                                            .text,
                                                    "tier": selectedTier!,
                                                  });
                                                });
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: Text("Add Truck"),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                              foregroundColor: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                child: Icon(Icons.add, color: Colors.white),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "lorem ipsum is a simple dumm",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    trucks.isEmpty
                        ? Center(
                            child: Text(
                              "no data",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: trucks.length,
                            itemBuilder: (context, index) {
                              final truck = trucks[index];
                              return Card(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(truck["number"] ?? ""),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${truck["description"] ?? ""} ",
                                          ),
                                          Text(" Tier: ${truck["tier"] ?? ""}"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearControllers() {
    truckNumberController.clear();
    descriptionController.clear();
  }
}
