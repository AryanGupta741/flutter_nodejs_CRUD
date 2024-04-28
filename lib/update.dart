// import 'package:crud_application/edit_screen.dart';
// import 'package:crud_application/models/personal_model.dart';
// import 'package:crud_application/services/Api.dart';
// import 'package:flutter/material.dart';

// class Updated_Data extends StatelessWidget {
//   const Updated_Data({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: FutureBuilder(
//           // Call the API method to fetch person data asynchronously
//           future: Api.getPersonS(),
//           // Builder function to handle different states of the Future
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.hasData) {
//               // If data is available in the snapshot
//               // Extract the list of Person objects from the snapshot data
//               // snapshot.data it give the instance of whole object
//               List<Person> pdata = snapshot.data;

//               // Return a ListView to display the person data
//               return ListView.builder(
//                 itemCount: pdata.length,

//                 // Builder function to create a widget for each person in the list
//                 itemBuilder: (BuildContext context, int index) {
//                   // Build a ListTile for each person
//                   return ListTile(
//                       leading: const Icon(Icons.person_2_outlined),
//                       title: Text("Name: ${pdata[index].name.toString()}"),
//                       subtitle: Text(
//                           "Phone: ${pdata[index].phone.toString()},Age: ${pdata[index].Age.toString()}"), // Changed 'Age' to 'age'
//                       trailing: IconButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Edit_Screen(data: pdata[index],)));
//                           },
//                           icon: Icon(Icons.edit)));
//                 },
//               );
//             } else {
//               // If no data is available in the snapshot
//               // Display a message indicating no data
//               return Text("No data");
//             }
//           },
//         ),
//       ),
//     );
//   }
// }


import 'package:crud_application/edit_screen.dart';
import 'package:crud_application/models/personal_model.dart';
import 'package:crud_application/services/Api.dart';
import 'package:flutter/material.dart';

class Updated_Data extends StatelessWidget {
  const Updated_Data({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
          // Call the API method to fetch person data asynchronously
          future: Api.getPersonS(),
          // Builder function to handle different states of the Future
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While waiting for data, show a loading indicator
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // If there's an error fetching data, display an error message
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (snapshot.hasData) {
              // If data is available in the snapshot
              // Extract the list of Person objects from the snapshot data
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
                      subtitle: Text(
                          "Phone: ${pdata[index].phone.toString()},Age: ${pdata[index].Age.toString()}"), // Changed 'Age' to 'age'
                      trailing: IconButton(
                          onPressed: () async {
                            // Handle edit button onPressed
                            try {
                              // Navigate to edit screen with data
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Edit_Screen(data: pdata[index]),
                                ),
                              );
                            } catch (e) {
                              // Handle errors gracefully
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Error"),
                                    content: Text("Failed to navigate to edit screen: $e"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          icon: Icon(Icons.edit)));
                },
              );
            } else {
              // If no data is available in the snapshot
              // Display a message indicating no data
              return Center(child: Text("No data"));
            }
          },
        ),
      ),
    );
  }
}
