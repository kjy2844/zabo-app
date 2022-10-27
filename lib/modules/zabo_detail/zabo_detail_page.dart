import 'package:flutter/material.dart';

class ZaboDetail extends StatefulWidget {
  const ZaboDetail({Key? key}) : super(key: key);

  @override
  State<ZaboDetail> createState() => _ZaboDetailState();
}

class _ZaboDetailState extends State<ZaboDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('zabo detail page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
