import 'package:flutter/material.dart';

import '../property_search/search_page.dart';
import 'mate_list_card.dart';

class RoomMatePage extends StatelessWidget {
  const RoomMatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(title: Text("Q-Mate", ),backgroundColor: Colors.green[300],
      actions: [
        Icon(Icons.filter_list),
        Icon(Icons.search_rounded),
      ]),*/
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 0.0),
        child: Column(
          children: [
            //banner
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                  boxShadow: [

                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/images/black_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(0.0),
                  ),
                ),
                child: Stack(
                  children: [

                    Positioned(
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.010,),
                          Text(
                            "Q-Mate",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                              color: Colors.green[200],
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.0025,),
                          Text(
                            textAlign: TextAlign.center,
                            "Find A Room-Mate",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                              color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                        ],
                      ),
                    ),
                   /* Positioned(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          //   color: Colors.green,
                          image: DecorationImage( image: AssetImage('assets/images/houseNig.jpg'),
                              fit: BoxFit.cover),
                          borderRadius:
                          BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),),
                      ),
                      top: 0,
                      right: 0,
                    )*/
                  ],
                ),
              ),
            ),
            //search
            Padding(
              padding: EdgeInsets.only(top:1, bottom: 0, left: 0, right: 0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage())
                  );
                },
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(0.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_rounded,
                        color: Colors.black54,
                      ),
                      Text("Search Q-Mate",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                            color: Colors.black54,
                            fontSize: 12,
                          )),
                    ],
                  ),
                ),
              ),
            ),

            //Mates List
            Expanded(child:
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
