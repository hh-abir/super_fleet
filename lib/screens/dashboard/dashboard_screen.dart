import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_fleet/models/onduty.dart';
import 'package:super_fleet/screens/dashboard/components/cardbutton.dart';
import 'package:super_fleet/screens/dashboard/components/fatbutton.dart';
import 'package:super_fleet/screens/dashboard/components/navigationbutton.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                width: size.width,
                height: size.height * 0.15,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: CircleAvatar(
                              radius: 30,
                              child: Image.network(
                                "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MD ABIR HOSSAIN",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF313866)),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "PIN: 101320",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF313866),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.car_crash),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            "4.4",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 30,
                          ),
                          const Icon(
                            Icons.notifications,
                            size: 40,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Row(
                        children: [
                          Text(
                            "25 Aug, 2023 | Sunday",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: null,
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xFF313866)),
                            ),
                            child: Text(
                              "Announcements",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.13,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    size.width * 0.1, 30, size.width * 0.1, 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CardButton(
                            func: () {
                              (context).go("/dashboard/requisition");
                            },
                            imgUrl: "assets/gifs/car-req.gif",
                            text: "Requisition",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CardButton(
                            func: () {
                              (context).go("/dashboard/nonrequisition");
                            },
                            imgUrl: "assets/gifs/car-nonreq.gif",
                            text: "Non Requisition",
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          CardButton(
                            func: () {
                              (context).go("/dashboard/summary");
                            },
                            imgUrl: "assets/gifs/checklist.gif",
                            text: "Summary",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CardButton(
                            func: () {
                              (context).go("/dashboard/requisition");
                            },
                            imgUrl: "assets/gifs/car-crash.gif",
                            text: "Crash Report",
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          CardButton(
                            func: (context) {
                              (context).go("/dashboard/requisition");
                            },
                            imgUrl: "assets/icons/car-repair.png",
                            text: "Defect Report",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CardButton(
                            func: () {
                              (context).go("/dashboard/requisition");
                            },
                            imgUrl: "assets/icons/leave-application.png",
                            text: "Leave Application",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFF504099),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NavigationButton(
                          ico: "assets/icons/home.png", text: "Home"),
                      NavigationButton(
                          ico: "assets/icons/profile.png", text: "Profile"),
                      NavigationButton(
                          ico: "assets/icons/contact.png", text: "Contact"),
                      NavigationButton(
                          ico: "assets/icons/logout.png", text: "Logout"),
                    ]),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.075,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFFE2DEF6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FatButton(
                      func: () {},
                      text: "Report",
                      ico: "assets/icons/report.png",
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.070,
                      width: MediaQuery.of(context).size.width * 0.8 / 3,
                      decoration: const BoxDecoration(
                        color: Color(0xFFC9C8EE),
                        borderRadius: BorderRadius.all(Radius.circular(34)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "assets/icons/refresh.png",
                                height: 25,
                                width: 25,
                              ),
                              const Text(
                                "Refresh",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ]),
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final onDutyList = ref.watch(onDutyProvider);
                        final onduty = onDutyList[0];
                        return FatButton(
                          func: () {
                            String userInput = '';
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                      'Input Your Current Meter Number'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          "Your Last Meter: ${onduty.currentMeter}"),
                                      TextField(
                                        onChanged: (value) {
                                          userInput =
                                              value; // Update the user input
                                        },
                                        decoration: const InputDecoration(
                                            labelText: 'Current Meter'),
                                        keyboardType: TextInputType.phone,
                                      ),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          final newOnDuty = [
                                            OnDuty(
                                                onduty: false,
                                                currentMeter: userInput)
                                          ];
                                          ref
                                              .read(onDutyProvider.notifier)
                                              .updateOnDutyList(newOnDuty);
                                          Navigator.pop(
                                              context); // Close the dialog
                                        },
                                        child: const Text('Submit Meter'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          text: "End Trip",
                          ico: "assets/icons/endtrip.png",
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
