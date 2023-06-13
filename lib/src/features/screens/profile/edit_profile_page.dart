import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
   EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';

  String _bio = '';
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

   final _schoolList = [
     "Federal University of Technology, Akure (FUTA)",
     "Achievers University",
     "Elizade University",
   ];
   final _levelList = [
     "100L",
     "200L",
     "300l",
     "400l",
     "500l",
     "Pre-degree",
     "Post Graduate",
   ];
   String? _selectedSchool;
   String? _selectedLevel;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit profile"), backgroundColor: Colors.white, centerTitle: true, foregroundColor: Colors.black),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left:16,right: 16,bottom: 16, top:0),
              child: ListView(padding: EdgeInsets.only(top:15),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //profile picture
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(1, 1),
                                spreadRadius: 1.1,
                                blurRadius: 6),
                          ],
                          shape: BoxShape.circle,

                        ),



                        child: Stack(
                          children: [
                            ClipOval(
                            child: Image(image: AssetImage("assets/images/boluProfile.jpg",), fit: BoxFit.fitWidth,
                              height: MediaQuery.of(context).size.height*0.2,
                              width:  MediaQuery.of(context).size.height*0.2,),

                          ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,


                                ),
                                child: IconButton(
                                  icon: Icon(Icons.camera_alt_rounded, color: Colors.green ),
                                  onPressed: () {
                                    _pickImage();
                                  },
                                ),
                              ),
                            ),
                          ],

                        ),
                      ),

                      SizedBox(height: 30,),
                      //form

                      Padding(padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name" ,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    //   height: 1.2
                                  )),
                              Container(
                                constraints: BoxConstraints(
                                  minWidth:  double.infinity,
                                //  minHeight: 20,
                                ),

                                child: TextFormField(

                                  maxLength: 50,
                                  maxLines: null,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                  decoration: InputDecoration(
                                    counterText: "",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(4.0)), // Adjust the border radius as desired
                                      borderSide: BorderSide(
                                        width: 2.0, // Set the border width
                                        color: Colors.black, // Set the border color
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black, // Set the border color when focused
                                      ),
                                    ),

                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    final wordCount = value.trim().split(' ').length;
                                    if (wordCount < 2 || wordCount > 3) {
                                      return 'format: FirstName LastName (OtherName)';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {_name = value!;},
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text("Bio" ,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    //   height: 1.2
                                  )),
                              Container(
                                constraints: BoxConstraints(
                                  minWidth:  double.infinity,
                                  //minHeight: 200,
                                ),

                                child: TextFormField(
                                  maxLength: 200,
                                  maxLines: null,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                  decoration: InputDecoration(
                                    counterText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4.0)), // Adjust the border radius as desired
                                borderSide: BorderSide(
                                  width: 2.0, // Set the border width
                                  color: Colors.black, // Set the border color
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black, // Set the border color when focused
                                ),
                              ),

                            ),
                                  validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                                  onSaved: (value) {_name = value!;},
                      ),
                        ),
                              SizedBox(height: 20,),
                              Text("School" ,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    //   height: 1.2
                                  )),
                              DropdownButtonFormField(
                                isExpanded: true,
                                value: _selectedSchool,
                                items: _schoolList.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _selectedSchool = val as String;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: Colors.black,
                                ),
                                dropdownColor: Colors.green[50],
                                decoration: InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)), // Adjust the border radius as desired
                                    borderSide: BorderSide(
                                      width: 2.0, // Set the border width
                                      color: Colors.black, // Set the border color
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black, // Set the border color when focused
                                    ),
                                  ),

                                ),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,overflow: TextOverflow.ellipsis
                                ),

                              ),
                              SizedBox(height: 20,),
                              Text("Level" ,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    //   height: 1.2
                                  )),
                              DropdownButtonFormField(
                                isExpanded: true,
                                value: _selectedLevel,
                                items: _levelList.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _selectedLevel = val as String;
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: Colors.black,
                                ),
                                dropdownColor: Colors.green[50],
                                decoration: InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)), // Adjust the border radius as desired
                                    borderSide: BorderSide(
                                      width: 2.0, // Set the border width
                                      color: Colors.black, // Set the border color
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black, // Set the border color when focused
                                    ),
                                  ),

                                ),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,overflow: TextOverflow.ellipsis
                                ),

                              ),
                              SizedBox(height: 15,),
                              Align(alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return EditProfilePage();
                                    }));
                                  },
                                  child:  Text("Save",
                                      textAlign: TextAlign.center,

                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                        color: Colors.white,
                                        fontSize: 12,
                                        //fontWeight: FontWeight.bold
                                      )),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
                                      padding: EdgeInsets.only(left: 18, right: 18),
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6)
                                      )

                                  ),
                                ),
                              ),

                            ]),
                      )
                      )
                    ],
                    )


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

