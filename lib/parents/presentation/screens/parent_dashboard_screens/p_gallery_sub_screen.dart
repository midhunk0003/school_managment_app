import 'package:flutter/material.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class PGallerySubScreen extends StatefulWidget {
  const PGallerySubScreen({Key? key}) : super(key: key);

  @override
  _PGallerySubScreenState createState() => _PGallerySubScreenState();
}

class _PGallerySubScreenState extends State<PGallerySubScreen> {
  List<Color> containerColors = [
    Color(0xFFEEEFF7),
    Color(0xFFF1FDE7),
    Color(0xFFFCE8E9),
    Color(0xFFFCF9B6),
  ];
  List<Color> containersmallColors = [
    Color(0xFF4A599B),
    Color(0xFF4EA70B),
    Color(0xFFCB1A20),
    Color(0xFFF6EE23),
  ];

  Future<void> _refreshData() async {
    // Simulate a network call or any async operation to refresh data
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Update your state here to refresh the UI
    });
  }

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: isTablet ? 40 : 20),
                  HeaderandBackwidget(text: 'Assignment'),
                  SizedBox(height: isTablet ? 60 : 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Classroom Fun',
                        style: TextStyle(
                          fontSize: isTablet ? 28 : 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '(12 Photos)',
                        style: TextStyle(
                          fontSize: isTablet ? 24 : 12,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isTablet ? 48 : 24),
                  Expanded(
                    child: Container(
                      child: RefreshIndicator(
                        onRefresh: _refreshData,
                        child: SingleChildScrollView(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isTablet ? 3 : 2,
                                  childAspectRatio: .7,
                                  crossAxisSpacing: 13,
                                  mainAxisSpacing: 13,
                                ),
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color:
                                      containerColors[index %
                                          containerColors.length],
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/teacher/gallery/classfun.png',
                                    ),
                                  ),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                      48,
                                      158,
                                      158,
                                      158,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
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
