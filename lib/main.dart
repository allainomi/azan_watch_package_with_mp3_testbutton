import 'package:flutter/material.dart';

void main() {
  runApp(AzanWatchApp());
}

class AzanWatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Azan Watch App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('اذان واچ ایپ'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mosque, size: 80, color: Colors.green),
              SizedBox(height: 20),
              Text(
                'اذان واچ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('نماز کے اوقات اور اذان'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('اذان سنیں'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
