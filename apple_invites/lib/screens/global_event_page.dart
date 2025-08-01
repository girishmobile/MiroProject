import 'package:flutter/material.dart';

class GlobalEventPage extends StatelessWidget {
  const GlobalEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Global Events',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Tenor Sans',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 14, 5, 43),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.event),
            title: Text('Global Event $index'),
            subtitle: const Text('This is a global event message.'),
          );
        },
      ),
    );
  }
}
