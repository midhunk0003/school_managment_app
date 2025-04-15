import 'package:flutter/material.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class DailyUpdateScreen extends StatefulWidget {
  const DailyUpdateScreen({Key? key}) : super(key: key);

  @override
  _DailyUpdateScreenState createState() => _DailyUpdateScreenState();
}

class _DailyUpdateScreenState extends State<DailyUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;

            return Padding(
              padding:
                  isTablet
                      ? const EdgeInsets.symmetric(horizontal: 50, vertical: 50)
                      : const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: isTablet ? 40 : 20),
                  HeaderandBackwidget(text: 'Daily Update'),
                  SizedBox(height: isTablet ? 80 : 40),
                  Text(
                    'Share your class highlights for today',
                    style: TextStyle(
                      fontSize: isTablet ? 40 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isTablet ? 40 : 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Share your class highlights for today',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                    maxLines: isTablet ? 10 : 5,
                  ),
                  SizedBox(height: isTablet ? 20 : 10),
                  Container(
                    height: isTablet ? 100 : 50,
                    decoration: BoxDecoration(
                      borderRadius:
                          isTablet
                              ? BorderRadius.circular(50)
                              : BorderRadius.circular(25),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        'Share',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isTablet ? 24 : 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
