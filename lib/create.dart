import 'package:crud_application/services/Api.dart';
import 'package:flutter/material.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});


//
//in this file we created textfield of the create the data in server
// 
  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  // controller is used because save the  data/text and controller
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController AgeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          SizedBox(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter Name",
              ),
            ),
          ),
          SizedBox(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Phone number ",
              ),
            ),
          ),
          SizedBox(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: AgeController,
              decoration: InputDecoration(
                hintText: "Enter age",
              ),
            ),
          ),
          const SizedBox(),
          ElevatedButton(
              onPressed: () {
                // create map to handel the fielddata
                var data = {
                  "pname": nameController.text.toString(),
                  "pphone": phoneController.text.toString(),
                  "pAge": AgeController.text.toString(),
                };
                // send the data addperson schema
                Api.addPerson(data);
              },
              child: Text("create"))
        ]),
      ),
    );
  }
}
