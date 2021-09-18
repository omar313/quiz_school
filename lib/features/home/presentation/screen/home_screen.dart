import 'package:flutter/material.dart';
import 'package:quiz_school/features/home/presentation/component/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Body(),
      ),
    );
  }
}
