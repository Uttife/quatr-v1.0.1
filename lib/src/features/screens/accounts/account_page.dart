import 'package:Quatr/src/features/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import '../../../commom_widgets/clickable_round_image.dart';
import '../../../commom_widgets/container.dart';
import '../../../commom_widgets/my_text.dart';
import '../accounts/account_settings.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Text("Profile/Settings!", style: Theme
        //     .of(context)
        //     .textTheme
        //     .displaySmall!
        //     .copyWith(
        //     color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
      // )
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left:16,right: 16,bottom: 16, top:32),
              child: ListView(
                children: [
                 GestureDetector(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                   },
                   child: Row(
                        children: [
                          ClickableRoundImage(image: AssetImage("assets/images/boluProfile.jpg"),  height: MediaQuery.of(context).size.height*0.06,
                            width:  MediaQuery.of(context).size.height*0.06,
                          onPressed:  () {Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));}),

                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyText(text: "Shotayo Boluwatife", fontSize: 14, fontWeight: FontWeight.bold,),
                                MyText(text: "bolutifeakorey@gmail.com", fontSize: 10, fontWeight: FontWeight.w300,),
                              ],
                            ),
                          ),
                        ],
                      ),
                 ),
                  Divider(thickness: 1),
                  Padding(
                    padding: EdgeInsets.only(top:0, left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      MyRowContainer(onClicked: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettings()));},
                          borderRadius: BorderRadius.circular(4),
                          paddingWContainer: EdgeInsets.all(8),
                          textFontWeight: FontWeight.bold,
                            icon: Icons.person, desc: "Account Settings", padding: EdgeInsets.only(top:16,left: 6, right: 16, bottom: 6 )),
                        MyRowContainer(
                            borderRadius: BorderRadius.circular(4),
                            paddingWContainer: EdgeInsets.all(8),
                            textFontWeight: FontWeight.bold,icon: Icons.favorite, desc: "Saved listings",  padding: EdgeInsets.only(top:16,left: 6, right: 16, bottom: 6 )),
                        MyRowContainer( borderRadius: BorderRadius.circular(4),
                            paddingWContainer: EdgeInsets.all(8),
                            textFontWeight: FontWeight.bold,
                            icon: Icons.collections_bookmark_rounded, desc: "My applications",   padding: EdgeInsets.only(top:16,left: 6,right: 16, bottom: 6 )),
                        MyRowContainer( borderRadius: BorderRadius.circular(4),
                            paddingWContainer: EdgeInsets.all(8),
                            textFontWeight: FontWeight.bold,
                            icon: Icons.question_answer, desc: "FAQ",  padding: EdgeInsets.only(top:16,left: 6, right: 16,bottom: 6 )),
                        MyRowContainer( borderRadius: BorderRadius.circular(4),
                            paddingWContainer: EdgeInsets.all(8),
                            textFontWeight: FontWeight.bold,
                            icon: Icons.rate_review, desc: "Rate us",  padding: EdgeInsets.only(top:16,left: 6,right: 16, bottom: 6 )),
                        MyRowContainer( borderRadius: BorderRadius.circular(4),
                            paddingWContainer: EdgeInsets.all(8),
                            textFontWeight: FontWeight.bold,
                            icon: Icons.assignment, desc: "Terms & Conditions",   padding: EdgeInsets.only(top:16,left: 6,right: 16, bottom: 6 )),
                        MyRowContainer( borderRadius: BorderRadius.circular(4),
                            paddingWContainer: EdgeInsets.all(8),
                            textFontWeight: FontWeight.bold,
                            icon: Icons.contact_support, desc: "Help & Support",   padding: EdgeInsets.only(top:16,left: 6,right: 16, bottom: 6 )),
                        MyRowContainer( borderRadius: BorderRadius.circular(4),
                            paddingWContainer: EdgeInsets.all(8),
                            textFontWeight: FontWeight.bold,
                            icon: Icons.logout, desc: "Sign out",
                            iconColor: Colors.red,
                            descColor: Colors.red,
                       padding: EdgeInsets.only(top:16,left: 6,right: 16, bottom: 6 )),
                      ],
                    )
                    ,
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




