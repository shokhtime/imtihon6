import 'package:flutter/material.dart';
import 'package:imtihon6/bloc/xarajat/xarajat_bloc.dart';
import 'package:imtihon6/ui/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<XarajatBloc>(
      create: (context) => XarajatBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
