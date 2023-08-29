import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_fleet/models/car_requisition.dart';
import 'package:super_fleet/models/onduty.dart';
import 'package:url_launcher/url_launcher.dart';

class RequisitionDetailScreen extends ConsumerWidget {
  const RequisitionDetailScreen({required this.carRequisition, super.key});
  final CarRequisition carRequisition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onDutyList = ref.watch(onDutyProvider);
    final onduty = onDutyList[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  carRequisition.imageUrl,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Center(
                child: Text(
                  carRequisition.name,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "PIN: ${carRequisition.pin.toString()}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  carRequisition.designation,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Req Number: ${carRequisition.requisitionNumber}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Destination: ${carRequisition.destination}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Time: ${carRequisition.time}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Date: ${carRequisition.date}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Pickup Location: ${carRequisition.pickupLocation}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Number of people: ${carRequisition.people}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Pickup Location: ${carRequisition.pickupLocation}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Number: ${carRequisition.number}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 50, // Set your desired height
              width: MediaQuery.of(context).size.width *
                  0.4, // Set your desired width
              child: TextButton(
                onPressed: () async {
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: carRequisition.number,
                  );
                  await launchUrl(launchUri);
                },
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.purple),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Call',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50, // Set your desired height
              width: MediaQuery.of(context).size.width *
                  0.4, // Set your desired width
              child: TextButton(
                onPressed: () {
                  String userInput = ''; // Store the user input
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Input Your Current Meter Number'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Your Last Meter: ${onduty.currentMeter}"),
                            TextField(
                              onChanged: (value) {
                                userInput = value; // Update the user input
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Current Meter'),
                              keyboardType: TextInputType.phone,
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                final newOnDuty = [
                                  OnDuty(onduty: true, currentMeter: userInput)
                                ];
                                ref
                                    .read(onDutyProvider.notifier)
                                    .updateOnDutyList(newOnDuty);
                                Navigator.pop(context); // Close the dialog
                              },
                              child: const Text('Submit Meter'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.purple),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)))),
                child: const Text(
                  'Start Trip',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
