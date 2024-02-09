import 'dart:io';

import 'package:abcbul/services/post_job/post_job_api_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'const.dart';

class CreateJobPage extends StatefulWidget {
  @override
  State<CreateJobPage> createState() => _JobPageState();
}

class _JobPageState extends State<CreateJobPage> {
  final TextEditingController contentHeaderController = TextEditingController();
  final TextEditingController contentDescriptionController =
      TextEditingController();

  var currentSelectedLocationValue = 'Şehiri Seç';

  String currentSelectedStatusValue = 'active';

  bool jobTimeContainerOne = false;
  bool jobTimeContainerTwo = false;
  bool jobTimeContainerThree = false;

  bool jobTypeContainerOne = false;
  bool jobTypeContainerTwo = false;
  bool jobTypeContainerThree = false;
  bool jobTypeContainerFour = false;
  File? image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        print(pickedFile.path);
        image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E293B),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
            top: MediaQuery.of(context).size.height * 0.15,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Yeni Ihale!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Ücretsiz oluşturun ve yaınlayın',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    border: Border.all(color: lightGreyColor),
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _pickImage();
                          },
                          child: image == null
                              ? SvgPicture.asset('images/placeholder-file.svg',
                                  semanticsLabel: 'My SVG Image',
                                  height: 150,
                                  width: 100)
                              : Image.file(
                                  image!,
                                  height: 150,
                                  width: 200,
                                ),
                        ),
                        CustomTextFieldInCreatingJob(
                          hintText: 'ornegin: villa peyjaj mimarisi',
                          prefixIcon: Icons.person,
                          label: 'Ihale basligi ....',
                          controller: contentHeaderController,
                        ),
                        CustomTextFieldInCreatingJob(
                          prefixIcon: Icons.person,
                          label: 'Ihale Aciklamasi',
                          hintText:
                              'Ihale hakkında bütün bilgiler buraya giriniz',
                          controller: contentDescriptionController,
                          containerHeight: 0.2,
                        ),
                        // Text('hi'),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(12)),
                                margin: EdgeInsets.only(bottom: 10, left: 20),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: MediaQuery.of(context).size.width * 0.1,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  icon: Icon(Icons.arrow_drop_down,
                                      color: Colors.white),
                                  iconSize: 30,
                                  underline:
                                      SizedBox(), // Hide the default underline
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  dropdownColor: Color(0xff10172A),
                                  value: currentSelectedLocationValue,

                                  items: citiesList.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18.0),
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      currentSelectedLocationValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(12)),
                                margin: EdgeInsets.only(
                                    bottom: 10, right: 20, left: 0),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: MediaQuery.of(context).size.width * 0.1,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  icon: Icon(Icons.arrow_drop_down,
                                      color: Colors.white),
                                  iconSize: 30,
                                  underline:
                                      SizedBox(), // Hide the default underline
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  dropdownColor: Color(0xff10172A),
                                  value: currentSelectedStatusValue,

                                  items: <String>[
                                    'active',
                                    'inactive',

                                    // Add more locations as needed
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      currentSelectedStatusValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 21.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      jobTimeContainerOne = true;
                                      jobTimeContainerTwo = false;
                                      jobTimeContainerThree = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: jobTimeContainerOne
                                                ? purpleColor
                                                : backgroundColor),
                                        color: lightGreyColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 50,
                                    width: 80,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '7 Gün',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      jobTimeContainerOne = false;
                                      jobTimeContainerTwo = true;
                                      jobTimeContainerThree = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: jobTimeContainerTwo
                                                ? purpleColor
                                                : backgroundColor),
                                        color: lightGreyColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 50,
                                    width: 80,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '15 Gün',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      jobTimeContainerOne = false;
                                      jobTimeContainerTwo = false;
                                      jobTimeContainerThree = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: jobTimeContainerThree
                                                ? purpleColor
                                                : backgroundColor),
                                        color: lightGreyColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 50,
                                    width: 80,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '30 Gün',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 21.0, vertical: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      jobTypeContainerOne = true;
                                      jobTypeContainerTwo = false;
                                      jobTypeContainerThree = false;
                                      jobTypeContainerFour = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: jobTypeContainerOne
                                                ? purpleColor
                                                : backgroundColor),
                                        color: lightGreyColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 70,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: purpleColor,
                                                  shape: BoxShape.circle),
                                            ),
                                          ),
                                          Expanded(
                                              child: Icon(
                                            Icons.lightbulb,
                                            color: purpleColor,
                                          )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Hizmet',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      jobTypeContainerOne = false;
                                      jobTypeContainerTwo = true;
                                      jobTypeContainerThree = false;
                                      jobTypeContainerFour = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: jobTypeContainerTwo
                                                ? purpleColor
                                                : backgroundColor),
                                        color: lightGreyColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 70,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: purpleColor,
                                                  shape: BoxShape.circle),
                                            ),
                                          ),
                                          Expanded(
                                              child: Icon(
                                            Icons.local_shipping,
                                            color: purpleColor,
                                          )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Nakliye',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      jobTypeContainerOne = false;
                                      jobTypeContainerTwo = false;
                                      jobTypeContainerThree = true;
                                      jobTypeContainerFour = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: jobTypeContainerThree
                                                ? purpleColor
                                                : backgroundColor),
                                        color: lightGreyColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 70,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: purpleColor,
                                                  shape: BoxShape.circle),
                                            ),
                                          ),
                                          Expanded(
                                              child: Icon(
                                            FontAwesomeIcons.building,
                                            color: purpleColor,
                                          )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Mimari',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      jobTypeContainerOne = false;
                                      jobTypeContainerTwo = false;
                                      jobTypeContainerThree = false;
                                      jobTypeContainerFour = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: jobTypeContainerFour
                                                ? purpleColor
                                                : backgroundColor),
                                        color: lightGreyColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 70,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: purpleColor,
                                                  shape: BoxShape.circle),
                                            ),
                                          ),
                                          Expanded(
                                              child: Icon(
                                            FontAwesomeIcons.box,
                                            color: purpleColor,
                                          )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Toptan',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 21.0),
                        //   child: ToggleButtons(
                        //     isSelected: [
                        //       jobTimeContainerOne,
                        //       jobTimeContainerTwo,
                        //       jobTimeContainerThree
                        //     ],
                        //     onPressed: (index) {
                        //       setState(() {
                        //         jobTimeContainerOne = index == 0;
                        //         jobTimeContainerTwo = index == 1;
                        //         jobTimeContainerThree = index == 2;
                        //       });
                        //     },
                        //     children: [
                        //       _buildToggleButton('7 Gün'),
                        //       _buildToggleButton('14 Gün'),
                        //       _buildToggleButton('30 Gün'),
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(height: 15),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        //   child: ToggleButtons(
                        //     isSelected: [
                        //       jobTypeContainerOne,
                        //       jobTypeContainerTwo,
                        //       jobTypeContainerThree,
                        //       jobTypeContainerFour
                        //     ],
                        //     onPressed: (index) {
                        //       setState(() {
                        //         jobTypeContainerOne = index == 0;
                        //         jobTypeContainerTwo = index == 1;
                        //         jobTypeContainerThree = index == 2;
                        //         jobTypeContainerFour = index == 3;
                        //       });
                        //     },
                        //     children: [
                        //       _buildToggleButton('Hizmet', Icons.lightbulb),
                        //       _buildToggleButton(
                        //           'Nakliye', Icons.local_shipping),
                        //       _buildToggleButton(
                        //           'Mimari', FontAwesomeIcons.building),
                        //       _buildToggleButton(
                        //           'Toptan', FontAwesomeIcons.box),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: lightGreyColor,
                                      borderRadius: BorderRadius.circular(4)),
                                  // color: Colors.orange,
                                  width: 100,
                                  height: 30,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Geri',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // '168', 360,720
                                  String selectedCategory = 'Hizmet';
                                  String selectedTime = '168';

                                  if (jobTypeContainerOne) {
                                    selectedCategory = 'Hizmet';
                                  } else if (jobTypeContainerTwo) {
                                    selectedCategory = 'Nakliye';
                                  } else if (jobTypeContainerThree) {
                                    selectedCategory = 'Mimari';
                                  } else if (jobTypeContainerFour) {
                                    selectedCategory = 'Toptan';
                                  }

                                  if (jobTimeContainerOne) {
                                    selectedTime = '168';
                                  } else if (jobTimeContainerTwo) {
                                    selectedTime = '360';
                                  } else if (jobTimeContainerThree) {
                                    selectedTime = '720';
                                  }

                                  bool result = await PostJob.postJob(
                                    cover: '$image',
                                    title: contentHeaderController.text,
                                    description:
                                        contentDescriptionController.text,
                                    status: currentSelectedStatusValue,
                                    category: selectedCategory,
                                    city: currentSelectedLocationValue,
                                    estimated_time: selectedTime,
                                    context: context,
                                  );

                                  if (result) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        showCloseIcon: true,
                                        backgroundColor: Colors.teal,
                                        content: Text(
                                          'yeni ihaleniz Başarıyla oluşturuldu',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                    await Future.delayed(Duration(seconds: 3));
                                    Navigator.pop(context);
                                  } else {
                                    print('an error occurred');
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: purpleColor,
                                      borderRadius: BorderRadius.circular(4)),
                                  // color: Colors.orange,
                                  width: 100,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      'Ihale Olustur',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildToggleButton(String text, [IconData? icon]) {
  return Container(
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: lightGreyColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: backgroundColor),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) Icon(icon, color: purpleColor),
        SizedBox(width: icon != null ? 8.0 : 0),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

class CustomTextFieldInCreatingJob extends StatelessWidget {
  final IconData prefixIcon;
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final double containerHeight;
  final String hintText;
  const CustomTextFieldInCreatingJob(
      {super.key,
      this.obscureText = false,
      required this.prefixIcon,
      required this.label,
      required this.controller,
      this.containerHeight = 0.1,
      this.hintText = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * containerHeight,
      child: TextField(
        maxLines: containerHeight != 0.1 ? 4 : 1,
        obscureText: obscureText,
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xff10172A),
            hintText: hintText,
            label: Text(
              label,
              style: TextStyle(
                color: Colors.grey.shade200,
              ),
              textAlign: TextAlign.center,
            ),
            prefixIcon: containerHeight == 0.1
                ? Icon(
                    prefixIcon,
                    size: 15,
                    color: Colors.white,
                  )
                : null,
            // hintText: 'Bul...',
            contentPadding: EdgeInsets.zero,
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w400),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
