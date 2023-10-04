import 'package:flutter/material.dart';

class CircleCategory extends StatelessWidget {
  const CircleCategory(
      {Key? key, required this.icon, required this.description})
      : super(key: key);

  final Icon icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.cyan,
            child: IconButton(
              onPressed: () {},
              icon: icon,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
