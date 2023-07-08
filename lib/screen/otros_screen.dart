import 'package:flutter/material.dart';

class OtrosScreen extends StatefulWidget {
  const OtrosScreen({super.key});

  @override
  State<OtrosScreen> createState() => _OtrosScreenState();
}

class _OtrosScreenState extends State<OtrosScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            elevation: 8,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text('Otros'),
          ),
        ),
      ),
    );
  }
}