import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Summary"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          const Expanded(child: CardCheckboxList()),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: TextButton(
              onPressed: null,
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 104, 31, 223)),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              child: const Text('Checked'),
            ),
          )
        ],
      ),
    );
  }
}

class CardCheckboxList extends StatefulWidget {
  const CardCheckboxList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardCheckboxListState createState() => _CardCheckboxListState();
}

class _CardCheckboxListState extends State<CardCheckboxList> {
  List<String> image = [
    "seatbelt",
    "mirrors",
    "dashboard_lights",
    "windshield",
    "weather",
    "fluid_level"
  ];
  List<String> title = [
    "seatbelt",
    "Mirrors",
    "Dashboard Lights",
    "Windshield and Mirrors",
    "Weather and Road Conditions ",
    "Check Fluid Levels"
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return CardCheckboxTile(
          title: title[index],
          image: "assets/gifs/${image[index]}.gif",
        );
      },
    );
  }
}

class CardCheckboxTile extends StatefulWidget {
  final String title;
  final String image;

  const CardCheckboxTile({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CardCheckboxTileState createState() => _CardCheckboxTileState();
}

class _CardCheckboxTileState extends State<CardCheckboxTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 4 : 2,
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isSelected
                  ? Image.asset("assets/gifs/checkbox.gif",
                      height: 100,
                      fit: BoxFit.cover,
                      key: UniqueKey()) // Replace with your image asset
                  : Image.asset(
                      widget.image,
                      key: UniqueKey(),
                      height: 100,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
