import 'package:flutter/material.dart';
import '../app_themes.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({super.key});

  @override
  RegistScreenState createState() => RegistScreenState();
}

class RegistScreenState extends State<RegistScreen> {
  final TextEditingController _controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Let\'s get started',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color ??
                      Colors.white,
                ),
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  controller: _controller1,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Phone number",
                    hintStyle: TextStyle(color: mahoganyColor),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    color: mahoganyColor,
                  ),
                  maxLines: 1,
                  cursorColor: Colors.blue,
                ),
              ),
              //____________________________Button____________________________
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                ),
                child:
                    const Text(style: TextStyle(color: Colors.white), 'Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
