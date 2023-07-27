import 'package:Quatr/src/common_widgets/my_text.dart';
import 'package:Quatr/src/screens/profile/edit_profile_page.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/my_container.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Account"), backgroundColor: Colors.white, centerTitle: true, foregroundColor: Colors.black),
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
                          child: Image(image: AssetImage("assets/images/boluProfile.jpg",), fit: BoxFit.fitWidth,
                            height: MediaQuery.of(context).size.height*0.18,
                            width:  MediaQuery.of(context).size.height*0.18,),

                        ),
                      ),

                      SizedBox(height: 10,),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(text: "Shotayo Boluwatife", fontWeight:FontWeight.bold, fontSize: 16,),
                            MyText(text: "@shotayobolu", fontWeight:FontWeight.w300, fontSize: 12,),
                            SizedBox(height: 4,),
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 6),
                              child: Text(
                                  "🔰Passionate Nigerian teen on a journey of self-discovery and growth. 🎓Student by day, dreamer by night. "
                                      "🌍Exploring the world one step at a time."
                                      "🎵Music lover, with a playlist for every mood.",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      //fontFamily: 'NotoColorEmoji',
                                    //  height: 1.1,
                                      wordSpacing: 0.1
                                  ),
                                //  maxLines: 5, overflow:TextOverflow.ellipsis
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
                                    children: [
                                      MyRowContainer(icon: Icons.apartment, desc: "Federal University of Technology, Akure(FUTA)",textFontWeight: FontWeight.bold),
                                      MyRowContainer(icon: Icons.school, desc: "300L-CSC",textFontWeight: FontWeight.bold),
                                      MyRowContainer(icon: Icons.fingerprint_rounded, desc: "25yo-Male",textFontWeight: FontWeight.bold),
                                      MyRowContainer(icon: Icons.people_alt_outlined, desc: "Available on Q-mate", textFontWeight: FontWeight.bold),
                                    ],
                                  ),
                                ),
                            SizedBox(height: 15,),

                            ElevatedButton(
                              onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context){
                                 return EditProfilePage();
                               }));
                              },
                              child: MyText(text: "Edit Profile", color: Colors.white,fontWeight: FontWeight.bold),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white,
                                  padding: EdgeInsets.only(left: 18, right: 18),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)
                                  )

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
