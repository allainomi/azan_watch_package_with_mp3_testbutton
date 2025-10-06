import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {
  final String currentPrayer;
  final String nextPrayer;
  final Map<String, String> prayerTimes;

  const TimeDisplay({
    super.key,
    required this.currentPrayer,
    required this.nextPrayer,
    required this.prayerTimes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[700],
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Current Prayer',
              style: TextStyle(
                color: Colors.green[100],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              currentPrayer,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Next: $nextPrayer at ${prayerTimes[nextPrayer] ?? ''}',
              style: TextStyle(
                color: Colors.green[100],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
