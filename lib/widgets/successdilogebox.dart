import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<void> successDialogBox(
  BuildContext context,
  String? maincontent,
  String? name,
) {
  Future.delayed(const Duration(seconds: 2), () {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  });

  return showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjust height dynamically
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/json/successanimation.json', height: 150),
                const SizedBox(height: 20),
                Text(
                  '$maincontent',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print('');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
  );
}
