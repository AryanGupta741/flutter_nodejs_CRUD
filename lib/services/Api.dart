// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// //192.168.17.241

// class Api {
//   static const baseUrl = "http://localhost:3000//api/";

//   static addPerson(Map pdata) async {
//     print("person data ${pdata}");
//     var url = Uri.parse(baseUrl + "add_person");
//     try {
//       final res = await http.post(url, body: pdata);

//       if (res.statusCode == 200) {
//         // when ok report
//         var data = jsonDecode(res.body.toString());
//         print(" this is api data ${data}");
//       } else {
//         //   // when not ok report
//         print("Failed t upload Data");
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
// }

// =================================================

import 'dart:convert';
import 'package:crud_application/models/personal_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Define a class for API requests
class Api {
  // Define the base URL for the API
  static const baseUrl = "http://localhost:3000/api/";

  // Define a method to add a person to the API
  static addPerson(Map pdata) async {
    print("person data ${pdata}"); // Print the person data for debugging

    // Construct the complete URL for adding a person
    // it's important to ensure that the resulting URL is properly formatted and encoded. The Uri.parse() function takes care of this by parsing the string and ensuring that it conforms to the URI syntax rules.
    var url = await Uri.parse(baseUrl + "add_person");

    try {
      // These two parameters are related to each other because the body parameter contains the data that you want to send to the URL specified in the url parameter. In other words, the url parameter tells the http.post() function where to send the request, and the body parameter provides the data to include in the request.
      // Make a POST request to add the person
      final res = await http.post(url, body: pdata);

      // Check the response status code
      if (res.statusCode == 200) {
        // When the response is OK, decode the response body
        var data = jsonDecode(res.body.toString());
        print(" this is api data ${data}"); // Print the API response data
      } else {
        // When the response is not OK, print a failure message
        print("Failed to upload data");
      }
    } catch (e) {
      // Catch any exceptions that occur during the request
      debugPrint(e.toString());
    }
  }

// ===========GET Method===========

  static getPersonS() async {
    // Initialize an empty list to store Person objects
    List<Person> person = [];

    // Define the URL to fetch data from
    var url = Uri.parse(baseUrl + "get_person");

    try {
      // Send an HTTP GET request to the specified URL
      final res = await http.get(url);

      // Check if the response status code is 200 (OK)
      if (res.statusCode == 200) {
        // Decode the response body from JSON format
        var data = jsonDecode(res.body);

        // Print the retrieved data for debugging purposes
        print("this is GET method ${data}");

        // Iterate over each item in the 'person' array in the retrieved data
        // and create a Person object for each item, then add it to the 'person' list
        // this is GET method {status_code: 200,
        // ==== *** person: [{id: 1, pname: 111112345678, pphone: 123456789, pAge: 98765432}
        data['person']?.forEach((value) => {
              person.add(Person(
                name: value['pname'],
                phone: value['pphone'],
                Age: value['pAge'],
                id: value["id"].toString()
              ))
            });

        // Return the list of Person objects
        //eturn statement is necessary to return the list of Person objects after populating it with data retrieved from the server.
        return person;
      } else {
        // If the response status code is not 200, return an empty list
        return [];
      }
    } catch (e) {
      // Handle any errors that occur during the HTTP request
      print("error: ${e.toString()}");
    }
  }

// This method is responsible for fetching a list of Person objects from a server endpoint (baseUrl + "get_person") using an HTTP GET request.
// It uses the http package to make HTTP requests and the jsonDecode function to decode the JSON response.
// The try block is used to catch any exceptions that may occur during the HTTP request, such as network errors or server errors.
// If the response status code is 200 (OK), it parses the JSON response, iterates over each item in the 'person' array, creates a Person object for each item, and adds it to the person list.
// Finally, it returns the list of Person objects.
// If the response status code is not 200, it returns an empty list.
// Any errors that occur during the HTTP request are caught in the catch block, and an error message is printed to the console.

// ===========Updated Method===========

  static updatePerson(id, body1) async {
    var url = Uri.parse(baseUrl + "update/$id");
    final res = await http.put(url, body: body1);
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("Failed to load DATA !");
    }
  }
}
