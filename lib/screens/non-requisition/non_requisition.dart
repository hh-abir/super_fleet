import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_fleet/models/car_requisition.dart';
import 'package:super_fleet/screens/non-requisition/non_requisition_detail.dart';

class NonRequisitionScreen extends StatelessWidget {
  const NonRequisitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Requisition",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
        body: Consumer(
          builder: ((context, ref, child) {
            final carRequisitions = ref.watch(isnotOfficial);

            return carRequisitions.when(
                data: (requisitions) {
                  return ListView.builder(
                      itemCount: requisitions.length,
                      itemBuilder: (context, index) {
                        final requisition = requisitions[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1EFF8),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(34)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  spreadRadius: 4,
                                  blurRadius: 5,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // Use Row to layout the image and text side by side
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.8,
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(34)),
                                        child: Image.network(
                                          requisition.imageUrl,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        width:
                                            20), // Add space between image and text
                                    Expanded(
                                      child: SizedBox(
                                        height: 150,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              requisition.name,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF311B55)),
                                            ),
                                            Text(
                                              "PIN: ${requisition.pin.toString()}",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black),
                                                children: [
                                                  const TextSpan(
                                                    text: 'Designation:\n',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  TextSpan(
                                                      text: requisition
                                                          .designation),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 8),
                                  child: Text(
                                    "Requisition Number: ${requisition.requisitionNumber}",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Destination:',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(
                                          width:
                                              10), // Add some space between the texts
                                      Flexible(
                                        child: Text(
                                          requisition.destination,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 8),
                                  child: Text(
                                    "Date: ${requisition.date}",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NonRequisitionDetailScreen(
                                                    carRequisition: requisition,
                                                  )),
                                        );
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.purple),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                      ),
                                      child: const Text(
                                        'Show Details',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                error: (error, stackTrace) =>
                    Center(child: Text('Error: $error')),
                loading: () =>
                    const Center(child: CircularProgressIndicator()));
          }),
        ));
  }
}
