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
              child: Container(
                height: isTablet ? 80 : 40,
                width: isTablet ? 80 : 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: isTablet ? 32 : 16,
                  ),
                ),
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
