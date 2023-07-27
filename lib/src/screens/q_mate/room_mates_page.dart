import 'package:flutter/material.dart';

import '../../common_widgets/my_text.dart';
import '../property_search/search_page.dart';
import 'mate_list_card.dart';

class RoomMatePage extends StatelessWidget {
  const RoomMatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 0.0),
        child: Column(
          children: [
            QMateHeader(),

            QMateSearchBar(),

            //Mates List
            Expanded(
              child:
            Container(
              color: Colors.white,
              child: ListView(
                shrinkWrap: true,
               padding: EdgeInsets.zero,
               children: [
                 MatesListcard(mate_name: "Shotayo Boluwatife", image: AssetImage("assets/images/boluProfile.jpg"),
                 bio_data: "23yo-Male", uni_data: "300L-CSC", bio: "🔰Passionate Nigerian teen on a journey of self-discovery and growth. 🎓Student by day, dreamer by night. "
                       "🌍Exploring the world one step at a time."
                       "🎵Music lover, with a playlist for every mood.", username: "@shotayobolu",


                 ),
                 MatesListcard(mate_name: "Ogunbiyi Lukmon", image: AssetImage("assets/images/rP1.jpeg"),
                 bio_data: "26yo-Male", uni_data: "400L-CYS"),
                 MatesListcard(mate_name: "Aliozor Ruth", image: AssetImage("assets/images/rp8.jpg"), bio_data: "19yo-Female", uni_data: "100L-FST"),
                 MatesListcard(mate_name: "Wahab Fadeyemi", uni_data: "100L-RGP", bio_data: "18yo-Male"),
                 MatesListcard(mate_name: "Alozie Victor", image: AssetImage("assets/images/rp2.jpeg"),
                     bio_data: "21yo-Male", uni_data: "200L-EEE"),
                 MatesListcard(mate_name: "Ifeosame Gideon", image: AssetImage("assets/images/rp4.jpg"), bio_data: "22yo-Male", uni_data: "200L-RGP"),
                 MatesListcard(mate_name: "Ajibade Funmilayo", bio_data: "20yo-Female", uni_data: "Pre-Degree"),
                 MatesListcard(mate_name: "Owoeye Esther", image: AssetImage("assets/images/rp5.jpeg"),
                     bio_data: "23yo-Female", uni_data: "300L-BIO"),
                 MatesListcard(mate_name:"Ihionu Paul", bio_data: "28yo-Male",uni_data: "Post-Graduate", ),
                 MatesListcard(mate_name: "Oguntuase Deborah", image: AssetImage("assets/images/rp6.jpg"),
                     bio_data: "27yo-Female", uni_data: "500L-FAT"),
                 MatesListcard(mate_name: "Williams David", image: AssetImage("assets/images/rp3.jpg"), bio_data: "18yo-Male", uni_data: "100L-PMT"),
                 MatesListcard(mate_name: "Aderigbe Kemi", image: AssetImage("assets/images/rp7.jpg"), bio_data: "20yo-Female", uni_data: "200L-SEN"),

                 MatesListcard(mate_name: "Folorunsho Precious", image: AssetImage("assets/images/rp9.jpeg"), bio_data: "26yo-Female", uni_data: "500L-QSV"),

               ],
              ),
            ),
            )
          ],
        ),
      )
      ,
    );
  }
}

class QMateSearchBar extends StatelessWidget {
  const QMateSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:1),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage())
          );
        },
        child: Container(
          height: 30,
         color:Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_rounded,
                color: Colors.black54,
              ),
              MyText(text: "Search Q-Mate",
                  textAlign: TextAlign.center,
                color: Colors.black54,
                    fontSize: 12,
                  )
            ],
          ),
        ),
      ),
    );
  }
}

class QMateHeader extends StatelessWidget {
  const QMateHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 0),
      child: Container(
        color: Colors.black,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Stack(
          children: [
            Positioned(
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.010,),
                  MyText(
                    text: "Q-Mate",
                     color: Colors.green[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    textAlign: TextAlign.start,
                    ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.0025,),
                  MyText(
                   text: "Find A Room-Mate",
                    color: Colors.white,
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
