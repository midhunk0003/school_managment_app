import 'package:flutter/material.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<Color> containerColors = [
    Color(0xFFEEEFF7),
    Color(0xFFF1FDE7),
    Color(0xFFFCE8E9),
    Color(0xFFFCF9B6),
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
                      ? const EdgeInsets.symmetric(horizontal: 40, vertical: 40)
                      : const EdgeInsets.symmetric(horizontal: 20),
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: isTablet ? 40 : 20),
                      HeaderandBackwidget(text: 'Gallery'),
                      SizedBox(height: isTablet ? 80 : 40),
                      Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 0.7,
                                ),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              // final category = categories[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/galleryphotosscreen',
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        containerColors[index %
                                            containerColors.length],
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        isTablet
                                            ? const EdgeInsets.all(20)
                                            : const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Category image
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.asset(
                                              'assets/images/teacher/gallery/classfun.png',
                                              // width: isTablet ? 320 : 160,
                                              height: isTablet ? 320 : 160,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        // Category name
                                        Text(
                                          'Classroom Fun',
                                          style: TextStyle(
                                            fontSize: isTablet ? 50 : 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '(12 photos)',
                                          style: TextStyle(
                                            fontSize: isTablet ? 30 : 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),

        floatingActionButton: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600; // tablet breakpoint

            return SizedBox(
              // width: isTablet ? 300 : 170, // wider on tablet
              height: isTablet ? 100 : 50, // taller on tablet
              child: FloatingActionButton.extended(
                onPressed: () {
                  // action when clicked
                  Navigator.pushNamed(context, '/gallerycreatealbumscreen');
                },
                backgroundColor: kButtonColor,
                icon: Icon(
                  Icons.add,
                  size: isTablet ? 50 : 24, // larger icon for tablet
                  color: kButtonTextColor,
                ),
                label: Text(
                  'Create Album',
                  style: TextStyle(
                    color: kButtonTextColor,
                    fontSize: isTablet ? 30 : 16, // larger text for tablet
                    fontWeight: FontWeight.bold,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
