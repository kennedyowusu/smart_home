import 'package:flutter/material.dart';
import 'dart:async';

class SmartItemContainer extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;
  final bool isOn;
  final int timerCount;

  const SmartItemContainer({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isOn,
    required this.timerCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.6,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isOn
              ? const Color(0xFFABC270)
              : const Color.fromARGB(44, 164, 167, 189),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imagePath,
                scale: 1.2,
                height: 60,
                width: 60,
                color: isOn ? Colors.white : Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isOn ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
            // if (isOn)
            //   Text(
            //     'Timer: $timerCount seconds',
            //     style: const TextStyle(
            //       color: Colors.red,
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
