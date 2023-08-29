import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarRequisition {
  final String requisitionNumber;
  final String name;
  final String destination;
  final String time;
  final String date;
  final String imageUrl;
  final bool isOfficial;
  final int pin;
  final String designation;
  final String pickupLocation;
  final String number;
  final int people;

  CarRequisition({
    required this.requisitionNumber,
    required this.name,
    required this.destination,
    required this.time,
    required this.date,
    required this.imageUrl,
    required this.isOfficial,
    required this.pin,
    required this.designation, // Initialize the new property
    required this.pickupLocation, // Initialize the new property
    required this.number, // Initialize the new property
    required this.people, // Initialize the new property
  });

  factory CarRequisition.fromJson(Map<String, dynamic> json) {
    return CarRequisition(
      requisitionNumber: json['requisitionNumber'],
      name: json['name'],
      destination: json['destination'],
      time: json['time'],
      date: json['date'],
      imageUrl: json['imageUrl'],
      isOfficial: json['isOfficial'],
      pin: json['pin'],
      designation: json['designation'],
      pickupLocation: json['pickupLocation'],
      number: json['number'],
      people: json['people'],
    );
  }
}

const jsonString = '''
  [
  {
    "requisitionNumber": "REQ12345",
    "name": "John Doe",
    "destination": "Airport",
    "time": "10:00 AM",
    "date": "2023-08-24",
    "imageUrl": "https://images.unsplash.com/photo-1503443207922-dff7d543fd0e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=327&q=80", 
    "isOfficial": true,
    "pin": 1234,
    "designation": "Manager",
    "pickupLocation": "Office Building A, Floor 5",
    "number": "0121324521",
    "people": 3
  },
  {
    "requisitionNumber": "REQ54321",
    "name": "Jane Smith",
    "destination": "Conference Center",
    "time": "02:30 PM",
    "date": "2023-09-10",
    "imageUrl": "https://plus.unsplash.com/premium_photo-1661715894857-64f4bdce8c79?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80", 
    "isOfficial": false,
    "pin": 9876,
    "designation": "Coordinator",
    "pickupLocation": "Main Lobby, Reception Desk",
    "number": "1",
    "people": 5
  },
  {
    "requisitionNumber": "REQ77777",
    "name": "Michael Johnson",
    "destination": "Client Meeting",
    "time": "09:15 AM",
    "date": "2023-08-30",
    "imageUrl": "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80", 
    "isOfficial": true,
    "pin": 5678,
    "designation": "Sales Representative",
    "pickupLocation": "Parking Lot B, Zone 2",
    "number": "3",
    "people": 2
  },
  {
    "requisitionNumber": "REQ22222",
    "name": "Emily Brown",
    "destination": "Team Retreat",
    "time": "08:00 AM",
    "date": "2023-09-15",
    "imageUrl": "https://images.unsplash.com/photo-1508341591423-4347099e1f19?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80", 
    "isOfficial": false,
    "pin": 4321,
    "designation": "Team Lead",
    "pickupLocation": "Front Entrance, Building C",
    "number": "4",
    "people": 8
  }
]



  ''';

final isOfficial = FutureProvider<List<CarRequisition>>((ref) {
  final List<CarRequisition> allRequisitions = (jsonDecode(jsonString) as List)
      .map((json) => CarRequisition.fromJson(json))
      .toList();
  final carRequisition =
      allRequisitions.where((requisition) => requisition.isOfficial).toList();

  return carRequisition;
});

final isnotOfficial = FutureProvider<List<CarRequisition>>((ref) {
  final List<CarRequisition> allRequisitions = (jsonDecode(jsonString) as List)
      .map((json) => CarRequisition.fromJson(json))
      .toList();
  final carRequisition =
      allRequisitions.where((requisition) => !requisition.isOfficial).toList();

  return carRequisition;
});
