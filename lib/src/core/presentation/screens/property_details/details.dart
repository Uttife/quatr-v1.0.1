import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/my_container.dart';
import '../../widgets/my_text.dart';
import '../../widgets/page_indicator.dart';

class PropDetails extends StatefulWidget {
  PropDetails({
    Key? key,
    required this.imageUrl,
    required this.description,
    required this.address,
    required this.rent,
    required this.isLike,
  }) : super(key: key);

  final String imageUrl;
  final String description;
  final String address;
  final String rent;

  // final VoidCallback onLikeChanged;
  final bool isLike;

  @override
  State<PropDetails> createState() => _PropDetailsState();
}

class _PropDetailsState extends State<PropDetails> {
  late PageController _pageController;
  int pageIndex = 0;
  int reviews = 23;
  double ratings = 4.7;
  final int bath_no = 2, bed_no = 3;
  late bool isLike;
  final List images_data = [
    "assets/images/house1.jpg",
    "assets/images/house2.jpg",
    "assets/images/house3.jpeg",
    "assets/images/house4.jpeg",
    "assets/images/house5.jpg",
  ];

  void shareTextToWhatsApp(String c_code, String phoneNum, String text) async {
    final Uri _url = Uri.parse(
        'https://wa.me/$c_code$phoneNum?text=${Uri.encodeFull(text)}');
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  void openWhatsApp() async {
    final Uri Murl = Uri.parse(
        'https://api.whatsapp.com/send?text=${Uri.encodeFull("Hi, Check out this property on Quatr\nwww.quatr.com.ng/property/23423")}');

    if (!await launchUrl(
      Murl,
      mode: LaunchMode.externalNonBrowserApplication,
    )) {
      throw Exception('Could not launch $Murl');
    }
  }

  void launchPhone(String phoneNumber) async {
    final Uri url = Uri.parse('tel:$phoneNumber');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    isLike = widget.isLike;
    for (int k = 0; k < images_data.length; k++) {
      if (widget.imageUrl == images_data[k]) {
        _pageController = PageController(initialPage: k);
      }
      super.initState();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //main layout
        Column(children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 52),
              color: Colors.blueGrey[50],
              width: double.infinity,
              child: ListView(children: [
                //image slider
                Stack(children: [
                  //image
                  Positioned(
                    child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: CarouselSlider.builder(
                            itemCount: images_data.length,
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(images_data[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.height,
                              autoPlay: true,
                              initialPage: 0,
                              pageSnapping: true,
                              autoPlayAnimationDuration:
                                  Duration(microseconds: 10),
                              viewportFraction: 1,
                              enableInfiniteScroll: true,
                              pauseAutoPlayInFiniteScroll: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  pageIndex = index;
                                });
                              },
                              //enlargeCenterPage: true,
                              // enlargeStrategy:
                            ))),
                  ),
                  //indicator
                  Positioned(
                      child: Container(
                        padding: EdgeInsets.only(left: 6, right: 6),
                        decoration: BoxDecoration(
                            // color: Colors.grey,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Row(
                          children: [
                            ...List.generate(
                              images_data.length,
                              (index) => PageIndicator(
                                isActive: index == pageIndex,
                                pageCounter: index,
                              ),
                            ),
                          ],
                        ),
                      ),
                      top: MediaQuery.of(context).size.height * 0.32,
                      left: 6
                      //MediaQuery.of(context).size.width*0.05
                      ),
                ]),

                //rest of the page
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 16, top: 12, bottom: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title and like button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: MyText(
                              text: widget.description,
                              textAlign: TextAlign.start,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLike = !isLike;
                                });
                                // widget.onLikeChanged();
                              },
                              child: isLike
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.green[400],
                                    )
                                  : Icon(
                                      Icons.favorite,
                                      color: Colors.grey,
                                    )),
                        ],
                      ),
                      //address
                      MyText(
                        text: widget.address,
                        fontSize: 12,
                        color: Colors.grey[900],
                      ),

                      //ratings
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange[400],
                          ),
                          SafeArea(
                              child: MyText(
                            text: "$ratings ($reviews Reviews)",
                            textAlign: TextAlign.start,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ))
                        ],
                      ),
                      //divider
                      Divider(thickness: 1),
                      MyText(
                        text: "Description",
                        textAlign: TextAlign.start,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        //        height: 1.2
                      ),
                      //Description
                      Text(
                        "Mijl residence estate.\n24hrs fully serviced estate with reasonable service charge as estate size is about 150 residents. Swimming pool, children's playground, gym and estate mini-mart. Title: governors consent ready.\n"
                        "Pay and park in property. Kindly call/ whatsapp us on 08080522756 or 08159452130 for any further enquiries.",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                      Divider(thickness: 1),
                      MyText(
                        text: "Property Details",
                        textAlign: TextAlign.start,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        //   height: 1.2
                      ),
                      //property details
                      Row(children: [
                        MyRowContainer(
                          icon: Icons.house_sharp,
                          desc: 'House',
                          containerColor: Colors.green[100],
                          paddingWContainer: EdgeInsets.all(8),
                          padding: EdgeInsets.only(top: 9, bottom: 8, right: 8),
                          textFontWeight: FontWeight.bold,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        MyRowContainer(
                          icon: Icons.hot_tub_outlined,
                          desc: 'Bathroom: $bath_no',
                          containerColor: Colors.green[100],
                          paddingWContainer: EdgeInsets.all(8),
                          padding: EdgeInsets.only(top: 9, bottom: 8, right: 8),
                          textFontWeight: FontWeight.bold,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ]),
                      Row(children: [
                        MyRowContainer(
                          icon: Icons.bed_rounded,
                          desc: 'Bedrooms: $bed_no',
                          containerColor: Colors.green[100],
                          paddingWContainer: EdgeInsets.all(8),
                          padding: EdgeInsets.only(top: 9, bottom: 8, right: 8),
                          textFontWeight: FontWeight.bold,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        MyRowContainer(
                          icon: Icons.garage,
                          desc: 'Garage',
                          containerColor: Colors.green[100],
                          paddingWContainer: EdgeInsets.all(8),
                          padding: EdgeInsets.only(top: 9, bottom: 8, right: 8),
                          textFontWeight: FontWeight.bold,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ]),
                      Row(children: [
                        MyRowContainer(
                          icon: Icons.smoking_rooms,
                          desc: 'No smoking',
                          containerColor: Colors.green[100],
                          paddingWContainer: EdgeInsets.all(8),
                          padding: EdgeInsets.only(top: 9, bottom: 8, right: 8),
                          textFontWeight: FontWeight.bold,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        MyRowContainer(
                          icon: Icons.pets_outlined,
                          desc: 'Pet friendly',
                          containerColor: Colors.green[100],
                          paddingWContainer: EdgeInsets.all(8),
                          padding: EdgeInsets.only(top: 9, bottom: 8, right: 8),
                          textFontWeight: FontWeight.bold,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ]),
                      Divider(thickness: 1),
                      //contact information
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, bottom: 8.0, top: 12),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image(
                                image: AssetImage(
                                  "assets/images/landlord1.jpg",
                                ),
                                fit: BoxFit.cover,
                                height: 45,
                                width: 45,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: "Awoleye Jide",
                                    textAlign: TextAlign.start,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    //   height: 1.2
                                  ),
                                  MyText(
                                    text: "Care taker",
                                    textAlign: TextAlign.start,
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    //   height: 1.2
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.mail_rounded,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      shareTextToWhatsApp('+1', '3068509733',
                                          "Hi Jide, I want to make enquiry on your quatr post");
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.phone,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      launchPhone('08108164147');
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ]),
        //share button
        Positioned(
          top: (MediaQuery.of(context).size.height * 0.04) + 12,
          right: MediaQuery.of(context).size.width * 0.02,
          child: Container(
            decoration:
                BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: IconButton(
              icon: Icon(
                Icons.share,
                size: 20,
                color: Colors.white,
              ),
              onPressed: () {
                openWhatsApp();
              },
            ),
          ),
        ),
        //back button
        Positioned(
          top: (MediaQuery.of(context).size.height * 0.04) + 12,
          left: MediaQuery.of(context).size.width * 0.01,
          child: Container(
            decoration:
                BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 20,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        //price and reserve button
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            padding:
                EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0, bottom: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,

              //shape: BoxShape.circle
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(6)),
                  padding: EdgeInsets.only(left: 8, right: 8),
                  //width: MediaQuery.of(context).size.width*0.25,
                  alignment: Alignment.center,
                  child: Text("N${widget.rent}",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Perform search action
                  },
                  child: Text("Make Enquiry",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                            //fontWeight: FontWeight.bold
                          )),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.only(left: 18, right: 18),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
