import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_model_test/view/order_view.dart';
import 'package:view_model_test/viewmodel/order_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => OrderViewModel(),
      dispose: (_, OrderViewModel viewModel) => viewModel.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const Column(
          children: [OrderView()],
        ),
      ),
    );
  }
}
