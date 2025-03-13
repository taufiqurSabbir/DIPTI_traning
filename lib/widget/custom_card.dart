import 'package:flutter/material.dart';

class customCard extends StatelessWidget {
  final String text,number;
  const customCard({
    super.key, required this.text, required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Column(
        children: [
          Text(text),
          Divider(
            color: Colors.black,
          ),
          Text(number),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){}, child: Text('Plus')) ,
              ElevatedButton(onPressed: (){}, child: Text('Min'))
            ],
          )
        ],
      ),
    );
  }
}
