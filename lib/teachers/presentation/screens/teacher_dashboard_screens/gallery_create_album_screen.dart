import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class GalleryCreateAlbumScreen extends StatefulWidget {
  const GalleryCreateAlbumScreen({Key? key}) : super(key: key);

  @override
  _GalleryCreateAlbumScreenState createState() =>
      _GalleryCreateAlbumScreenState();
}

class _GalleryCreateAlbumScreenState extends State<GalleryCreateAlbumScreen> {
  final TextEditingController albumTitleController = TextEditingController();

  // String? selectAlbumphoto;
  final List<File> _images = [];

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  void _showPickerOptions() {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Pick from Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Take a Photo'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
    );
  }

  final _formKey = GlobalKey<FormState>();
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: isTablet ? 40 : 20),
                    HeaderandBackwidget(text: 'Create New Album'),
                    SizedBox(height: isTablet ? 80 : 40),

                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Album Title',
                              style: TextStyle(fontSize: isTablet ? 24 : 12),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                fontSize: isTablet ? 24 : 12,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isTablet ? 20 : 10),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Album Title',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter album title";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: isTablet ? 40 : 20),
                        Row(
                          children: [
                            Text(
                              'Upload Photos',
                              style: TextStyle(fontSize: isTablet ? 24 : 12),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                fontSize: isTablet ? 24 : 12,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isTablet ? 20 : 10),
                        GestureDetector(
                          onTap: () {
                            _showPickerOptions();
                          },
                          child: Container(
                            height: isTablet ? 300 : 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    'assets/images/teacher/gallery/photo.png',
                                  ),
                                ),
                                SizedBox(height: isTablet ? 20 : 10),
                                Text(
                                  'Tap to upload photos',
                                  style: TextStyle(
                                    fontSize: isTablet ? 24 : 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        if (_images.isNotEmpty)
                          Container(
                            height: isTablet ? 200 : 100,
                            child: Stack(
                              children: [
                                ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _images.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.file(
                                              _images[index],
                                              width: isTablet ? 180 : 100,
                                              height: isTablet ? 180 : 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),

                                          // Delete button
                                          Positioned(
                                            top: 8,
                                            right: 8,
                                            child: CircleAvatar(
                                              radius: isTablet ? 20 : 15,
                                              backgroundColor: Colors.red
                                                  .withOpacity(0.8),
                                              child: Icon(
                                                Icons.delete_outline,
                                                color: Colors.white,
                                                size: isTablet ? 24 : 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: 30),
                        Container(
                          height: isTablet ? 100 : 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              'Save Album',
                              style: TextStyle(
                                fontSize: isTablet ? 24 : 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
