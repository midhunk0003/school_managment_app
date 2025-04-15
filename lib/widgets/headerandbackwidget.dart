import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderandBackwidget extends StatelessWidget {
  final String? text;
  const HeaderandBackwidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if the device is a tablet (typically > 600px width)
        bool isTablet = constraints.maxWidth > 600;

        return Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: isTablet ? 50 : 25, // Larger back button for tablet
                child: Icon(
                  Icons.arrow_back,
                  size: isTablet ? 50 : 25, // Larger icon for tablet
                ),
                backgroundColor: const Color.fromARGB(255, 207, 207, 207),
              ),
            ),
            SizedBox(width: isTablet ? 20 : 10), // More spacing for tablet
            Text(
              '$text',
              style: GoogleFonts.josefinSans(
                fontSize: isTablet ? 40 : 20, // Larger text for tablet
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
    );
  }
}
