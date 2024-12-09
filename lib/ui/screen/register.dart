import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../themes/app_themes.dart';
import 'package:drakojam/bloc/register_bloc.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({super.key});

  @override
  RegistScreenState createState() => RegistScreenState();
}

class RegistScreenState extends State<RegistScreen> {
  int _index = 0;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _countryCodeController =
      TextEditingController(text: '+1'); // Default country code
  final List<String> _fieldText = ['Phone number', 'Type code', 'Password'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          } else if (state is ValidationErrorMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          } else if (state is Registered) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registered successfully')),
            );
          }
        },
        child: buildRegisterForm(),
      ),
    );
  }

  Widget buildRegisterForm() {
    // Builds a form with header text, text field, and an elevated button
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildHeaderText(),
            const SizedBox(height: 60),
            buildCountryCodeField(),
            const SizedBox(height: 10),
            buildTextField(),
            const SizedBox(height: 30),
            buildElevatedButton(),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderText() {
    return Text(
      'Let\'s get started',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white,
      ),
    );
  }

  Widget buildCountryCodeField() {
    return SizedBox(
      width: 100,
      height: 50,
      child: TextField(
        controller: _countryCodeController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: 'Country Code',
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
    );
  }

  Widget buildTextField() {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        controller: _controller1,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: _fieldText[_index],
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
    );
  }

  Widget buildElevatedButton() {
    return ElevatedButton(
      onPressed: onPressedElevatedButton,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Text(
        'Submit',
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white,
        ),
      ), // Add a Text widget as the child
    );
  }

  void onPressedElevatedButton() {
    setState(() {
      _handleCurrentStep();
      _incrementIndexIfPossible();
    });
  }

  void _handleCurrentStep() {
    switch (_index) {
      case 0:
        _handlePhoneNumberSubmission();
        break;
      case 1:
        break;
      case 2:
        break;
      default:
        break;
    }
  }

  void _handlePhoneNumberSubmission() {
    final phoneNumber = _countryCodeController.text + _controller1.text;
    context
        .read<RegisterBloc>()
        .add(RegisterWithPhoneNumber(phoneNumber: phoneNumber));
  }

  void _incrementIndexIfPossible() {
    if (_index < _fieldText.length - 1) {
      _index++;
      _controller1.clear();
    }
  }
}
