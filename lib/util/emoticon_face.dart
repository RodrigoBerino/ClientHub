import 'package:flutter/material.dart';

class EmoticonFace extends StatelessWidget {
  final IconData icon;

  const EmoticonFace({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Center(child: Icon(icon, color: Colors.white, size: 28)),
    );
  }
}
