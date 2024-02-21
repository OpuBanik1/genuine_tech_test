import 'package:flutter/material.dart';
import 'package:genuinetech_test/src/provider/customer_provider.dart';
import 'package:genuinetech_test/view/registration.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Customer_provider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Registration(),
      ),
    );
  }
}
