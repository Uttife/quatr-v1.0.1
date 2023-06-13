import 'package:Quatr/src/commom_widgets/clickable_round_image.dart';
import 'package:Quatr/src/features/screens/discover/home_page.dart';
import 'package:Quatr/src/features/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../commom_widgets/container.dart';
import '../../../commom_widgets/my_text.dart';
import 'mate_profile_screen.dart';

class MatesListcard extends StatelessWidget {
  const MatesListcard({Key? key,  this.image = const AssetImage("assets/images/blank_user.jpeg"),  this.mate_name = "Niggas InVegas",  this.school_name = "Federal University of Technology, Akure(FUTA)",  this.uni_data="400L-CYS",
    this.bio_data ="70yo-Man",  this.bio = "Happy to be one of the first in Nigeria to use Quatr! "
        "🌍Exploring the world one step at a time.",  this.username = "@qmateuser2376"}) : super(key: key);

  final ImageProvider image;
  final String mate_name;
  final String school_name;
  final String uni_data;
  final String bio_data;
  final String bio;
  final String username;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: GestureDetector(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context){
                return MateProfileScreen(
                  mate_name: mate_name,
                  mate_biodata: bio_data,
                  mate_uni_data: uni_data,
                  profile_image: image,
                  mate_uni_name: school_name,
                  mate_bio:bio ,
                  mate_username: username,
                );
              }));},
              child: Container(
                    decoration: BoxDecoration(color: Colors.blueGrey[50],
                    ),
                    padding: EdgeInsets.only(top:6, bottom: 6, right: 6, left:12),
                    child: Row(
                      children: [
                        ClickableRoundImage(image: image, onPressed: null,
                          width: MediaQuery.of(context).size.width*0.1,
                          height: MediaQuery.of(context).size.width*0.1,
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(text: mate_name, fontWeight: FontWeight.bold,fontSize: 16, ),
                            Row(
                              children: [
                                MyRowContainer(icon: Icons.fingerprint_rounded, desc: bio_data, iconColor: Colors.blueGrey,
                                    fontsize: 9,
                                    textFontWeight: FontWeight.bold,
                                    padding: EdgeInsets.all(0),
                                    paddingWContainer: EdgeInsets.all(0)),
                                SizedBox(width: 5,),
                                MyRowContainer(icon: Icons.school, desc: uni_data, iconColor: Colors.blueGrey,
                                    fontsize: 9,
                                    textFontWeight: FontWeight.bold,
                                    padding: EdgeInsets.all(0),
                                    paddingWContainer: EdgeInsets.all(0)),
                              ],
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
            ),
    );
  }
}
