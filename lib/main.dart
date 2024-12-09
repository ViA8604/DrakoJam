import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drakojam/bloc/register_bloc.dart';
import 'ui/screen/register.dart';
import 'ui/themes/app_themes.dart';
import 'bloc/services/telegram_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TelegramService telegramService = TelegramService();
  telegramService.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
          create: (_) => RegisterBloc(telegramService),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'drakojam',
      theme: classicThemeDark,
      home: const RegistScreen(),
    );
  }
}
