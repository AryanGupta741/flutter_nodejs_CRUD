import 'package:crud_application/models/personal_model.dart';
import 'package:crud_application/services/Api.dart';
import 'package:flutter/material.dart';

class Edit_Screen extends StatefulWidget {
  final Person data;

  const Edit_Screen({super.key, required this.data});

//
//in this file we created textfield of the create the data in server
//z
  @override
  State<Edit_Screen> createState() => _Edit_ScreenState();
}

class _Edit_ScreenState extends State<Edit_Screen> {
  // controller is used because save the  data/text and controller
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController AgeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  It's important to use widget to access properties of the widget in this context because you're inside the widget's build method, and widget provides access to the widget's properties.
    nameController.text = widget.data.name.toString();
    phoneController.text = widget.data.phone.toString();
    AgeController.text = widget.data.Age.toString();
  }

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
                Api.updatePerson(1, {
                  "pname" : nameController.text,
                  "pphone" : phoneController.text,
                  "pAge" : AgeController.text,
                  "id" : widget.data.id.toString(),
                  
                  });
              },
              child: Text("UPDATE"))
        ]),
      ),
    );
  }
}
