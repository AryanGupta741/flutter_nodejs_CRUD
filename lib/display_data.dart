import 'package:crud_application/models/personal_model.dart';
import 'package:crud_application/services/Api.dart';
import 'package:flutter/material.dart';

class Display_Data extends StatelessWidget {
  const Display_Data({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Container(
  child: FutureBuilder(
    // Call the API method to fetch person data asynchronously
    future: Api.getPersonS(),
    // Builder function to handle different states of the Future
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        // If data is available in the snapshot
        // Extract the list of Person objects from the snapshot data
        // snapshot.data it give the instance of whole object 
        List<Person> pdata = snapshot.data;

        // Return a ListView to display the person data
        return ListView.builder(
           
          itemCount: pdata.length,
         
          // Builder function to create a widget for each person in the list
          itemBuilder: (BuildContext context, int index) {
            // Build a ListTile for each person
            return ListTile(
              leading: const Icon(Icons.person_2_outlined),
              title: Text("Name: ${pdata[index].name.toString()}"),
              subtitle: Text("Phone: ${pdata[index].phone.toString()}"),
              trailing: Text("Age: ${pdata[index].Age.toString()}"), // Changed 'Age' to 'age'
            );
          },
        );
      } else {
        // If no data is available in the snapshot
        // Display a message indicating no data
        return Text("No data");
      }
    },
  ),
),


    );
  }
}
