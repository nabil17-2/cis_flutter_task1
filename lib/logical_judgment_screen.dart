import 'dart:async';
import 'package:flutter/material.dart';

class LogicalJudgmentScreen extends StatefulWidget {
  const LogicalJudgmentScreen({Key? key}) : super(key: key);

  @override
  State<LogicalJudgmentScreen> createState() => _LogicalJudgmentScreenState();
}

class _LogicalJudgmentScreenState extends State<LogicalJudgmentScreen> {
  int weight = 0;
  double scaleOffset = 0;
  Timer? bubbleTimer;

  List<double> bubbles = [];

  void startDroppingBubbles() {
    bubbleTimer = Timer.periodic(const Duration(milliseconds: 600), (timer) {
      setState(() {
        bubbles.add(0);
      });
    });
  }

  void stopDroppingBubbles() {
    bubbleTimer?.cancel();
  }

  void updateBubbles() {
    setState(() {
      for (int i = 0; i < bubbles.length; i++) {
        bubbles[i] += 5;

        if (bubbles[i] >= 400) {
          weight += 1;
          scaleOffset += 6;
          bubbles.removeAt(i);
          i--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 30), updateBubbles);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Logical Judgment"),
        centerTitle: true,
      ),
      body: Stack(
        children: [

          // BUBBLES
          ...bubbles.map((top) {
            return Positioned(
              top: top,
              left: MediaQuery.of(context).size.width / 2 - 12,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
              ),
            );
          }).toList(),

          //  SCALE
          Positioned(
            bottom: 120 - scaleOffset,
            left: 40,
            right: 40,
            child: Container(
              height: 14,
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          // WEIGHT TEXT
          Positioned(
            bottom: 160,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Weight: $weight units",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          //
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // PRESS & HOLD
                  GestureDetector(
                    onTapDown: (_) => startDroppingBubbles(),
                    onTapUp: (_) => stopDroppingBubbles(),
                    onTapCancel: stopDroppingBubbles,
                    child: Container(
                      width: 180,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "Press & Hold",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // NAVIGATION BUTTON
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/property');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Go to Property Info",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
