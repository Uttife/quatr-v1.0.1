import 'package:Quatr/src/common_widgets/my_text.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/my_container.dart';

class MateProfileScreen extends StatelessWidget {
  const MateProfileScreen({Key? key, required this.profile_image, required this.mate_name,
    required this.mate_bio,
    required this.mate_biodata, this.mate_uni_name = "Federal University of Technology, Akure(FUTA)", required this.mate_uni_data,  this.mate_username = "@qmateuser2376" }) : super(key: key);

  final ImageProvider profile_image;
  final String mate_name;
  final String mate_bio;
  final String mate_biodata;
  final String mate_uni_name;
  final String mate_uni_data;
  final String mate_username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mate Info"), backgroundColor: Colors.white, foregroundColor: Colors.black),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left:16,right: 16,bottom: 16, top:0),
              child: ListView(padding: EdgeInsets.only(top:15),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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

                        child: ClipOval(
                          child: Image(image:profile_image, fit: BoxFit.fitWidth,
                            height: MediaQuery.of(context).size.height*0.18,
                            width:  MediaQuery.of(context).size.height*0.18,),

                        ),
                      ),

                      SizedBox(height: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(text: mate_name, fontWeight:FontWeight.bold, fontSize: 16,),
                          MyText(text: mate_username, fontWeight:FontWeight.w300, fontSize: 12,),
                          SizedBox(height: 4,),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 6),
                            child: Text(
                             mate_bio ,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: Colors.black,
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  //fontFamily: 'NotoColorEmoji',
                                  //  height: 1.1,
                                  wordSpacing: 0.1
                              ),
                            ),
                          ),
                          SizedBox(height: 4,),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius:  BorderRadius.circular(10)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyRowContainer(icon: Icons.apartment, desc: mate_uni_name,textFontWeight: FontWeight.bold, ),
                                MyRowContainer(icon: Icons.school, desc: mate_uni_data,textFontWeight: FontWeight.bold),
                                MyRowContainer(icon: Icons.fingerprint_rounded, desc: mate_biodata,textFontWeight: FontWeight.bold),
                                MyRowContainer(icon: Icons.people_alt_outlined, desc: "Available on Q-mate", textFontWeight: FontWeight.bold),

                              ],
                            ),
                          ),
                          SizedBox(height: 50,),

                          Container(
                            width: double.infinity,
                            // height: 30,
                            decoration: BoxDecoration(
                               color: Colors.black, borderRadius: BorderRadius.circular(6),
                            ),
                            child: ElevatedButton(
                              onPressed: null,
                                  /*() {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return EditProfilePage();
                                }));
                              },*/
                              child: MyText(text: "Chat", color: Colors.white,fontWeight: FontWeight.bold, fontSize: 14),

                            ),
                          ),
                        ],
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
