import 'package:flutter/material.dart';

class ClassShaduleScreen extends StatefulWidget {
  const ClassShaduleScreen({Key? key}) : super(key: key);

  @override
  _ClassShaduleScreenState createState() => _ClassShaduleScreenState();
}

class _ClassShaduleScreenState extends State<ClassShaduleScreen> {
  List<Color> containerColors = [
    Color(0xFFFDF0E7),
    Color(0xFFF1FDE7),
    Color(0xFFEEEFF7),
  ];
  List<Color> containertextColors = [
    Color(0xFFFDF0E7),
    Color.fromARGB(255, 0, 0, 0),
    Color(0xFFEEEFF7),
  ];
  List<Color> containerColorsedit = [
    Color(0xFF4A599B),
    Color.fromARGB(255, 228, 221, 34),
    Color(0xFF4EA70B),
  ];

  List<String> periodname = ['Mathematics', 'English', 'Science'];

  List<Map<String, String>> containerImagesEdit = [
    {
      'maths': 'assets/images/parent/classshadule/maths.png',
      'english': 'assets/images/parent/classshadule/english.png',
      'science': 'assets/images/parent/classshadule/science.png',
    },
    {
      'maths': 'assets/images/parent/classshadule/blackmaths.png',
      'english': 'assets/images/parent/classshadule/blackenglish.png',
      'science': 'assets/images/parent/classshadule/blackscience.png',
    },
    {
      'maths': 'assets/images/parent/classshadule/maths.png',
      'english': 'assets/images/parent/classshadule/english.png',
      'science': 'assets/images/parent/classshadule/science.png',
    },
  ];

  Future<void> _refreshData() async {
    // Simulate a network request or data refresh
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // Update your data here
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;

        return RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10, // Number of containers
              itemBuilder: (context, index1) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding:
                          isTablet
                              ? const EdgeInsets.all(20)
                              : const EdgeInsets.all(10),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: isTablet ? 30 : 20,
                        ), // space for Positioned widget
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: const Color.fromARGB(
                                255,
                                233,
                                229,
                                229,
                              ), // choose your color
                              width: 1.5, // choose your width
                            ),
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black12,
                          //     blurRadius: 6,
                          //     offset: Offset(0, 2),
                          //   ),
                          // ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: isTablet ? 20 : 10);
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                // height: isTablet ? 140 : 70,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEFF7), // Hex color,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: isTablet ? 100 : 50,
                                        width: isTablet ? 100 : 50,
                                        decoration: BoxDecoration(
                                          color:
                                              containerColorsedit[index1 %
                                                  containerColorsedit.length],

                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            '${containerImagesEdit[index1 % containerImagesEdit.length]['maths']}',
                                            height: isTablet ? 60 : 30,
                                            width: isTablet ? 60 : 30,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: isTablet ? 10 : 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Period 1: ${periodname[index % periodname.length]}',
                                          ),
                                          Text('8:00 AM – 8:45 AM'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    // Label above container
                    Positioned(
                      top: isTablet ? 20 : 14, // move up
                      left: isTablet ? 5 : 1,
                      child: Container(
                        height: isTablet ? 60 : 30,
                        width: isTablet ? 286 : 143,
                        decoration: BoxDecoration(
                          color:
                              containerColorsedit[index1 %
                                  containerColorsedit.length],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Monday, 3 March',
                            style: TextStyle(
                              color:
                                  containertextColors[index1 %
                                      containertextColors.length],
                              fontSize: isTablet ? 18 : 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
