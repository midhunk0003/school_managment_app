import 'package:flutter/material.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class PGalleryScreen extends StatefulWidget {
  const PGalleryScreen({Key? key}) : super(key: key);

  @override
  _PGalleryScreenState createState() => _PGalleryScreenState();
}

class _PGalleryScreenState extends State<PGalleryScreen> {
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
                children: [
                  SizedBox(height: isTablet ? 40 : 20),
                  HeaderandBackwidget(text: 'Assignment'),
                  SizedBox(height: isTablet ? 60 : 30),
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
                                  childAspectRatio: .8,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/pgallerysubscreen',
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        containerColors[index %
                                            containerColors.length],
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                        48,
                                        158,
                                        158,
                                        158,
                                      ),
                                    ),
                                  ),

                                  child: Padding(
                                    padding:
                                        isTablet
                                            ? const EdgeInsets.all(24)
                                            : const EdgeInsets.all(12),
                                    child: Container(
                                      height: isTablet ? 400 : 200,
                                      decoration: BoxDecoration(
                                        // color: Colors.amber,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: isTablet ? 320 : 160,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                    'assets/images/teacher/gallery/classfun.png',
                                                  ),
                                                ),
                                                color: Colors.green,
                                                borderRadius:
                                                    isTablet
                                                        ? BorderRadius.circular(
                                                          12,
                                                        )
                                                        : BorderRadius.circular(
                                                          6,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: isTablet ? 16 : 8),
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
