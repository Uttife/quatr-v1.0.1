import 'package:Quatr/src/features/screens/login/login_screen.dart';
import 'package:Quatr/src/features/screens/onboarding/page_indicator.dart';
import 'package:Quatr/src/commom_widgets/page_indicator.dart';
import 'package:Quatr/src/features/screens/signup/sign_up_screen.dart';
import 'package:Quatr/src/utils/theme/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../commom_widgets/my_button.dart';
import '../../../commom_widgets/my_text.dart';
import '../../models/onboarding_model.dart';
import '../Discover/home_page.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  late CarouselController _pageController;
  int pageIndex = 0;


  @override
  void initState() {
    _pageController = CarouselController();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Theme(
      data: BAppTheme.onBoardTheme,
      child: Scaffold(
          appBar: null,


          body: SafeArea(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 16, right: 16),
                  child: Container(
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyText(text: "Quatr",fontWeight: FontWeight.bold,fontSize: 32, color: Colors.black, textAlign: TextAlign.justify, )
                      ],
                    ),
                  ),
                ),

                //slider
                Expanded(

                  child: Container(
              //      color: Colors.blueGrey,
                    child: CarouselSlider.builder(itemCount: demo_data.length,
                        itemBuilder: (context, index, realIndex) {
                      return OnboardContent(
                        size: size,
                        image: demo_data[index].image,
                        title1: demo_data[index].title1,
                        title2: demo_data[index].title2,
                        description:demo_data[index].description,
                      );
                        },
                        options: CarouselOptions(height: MediaQuery.of(context).size.height,
                          autoPlay: true,
                          initialPage: 0,
                          pageSnapping: true,
                          autoPlayAnimationDuration: Duration( microseconds: 10),
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          pauseAutoPlayInFiniteScroll: true,
                          onPageChanged: (index, reason){
                            setState(() {
                              pageIndex = index;
                            });
                          },
                          //enlargeCenterPage: true,
                         // enlargeStrategy:
                        )
                    ),
                  )


                ),

                //page indicator
               /* Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child:
                  Container(
                    width: 60,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                       color: Colors.grey,
                        shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          demo_data.length,
                              (index) => PageIndicator(
                            isActive: index == pageIndex,
                            pageCounter: index,
                          ),

                        ),
                      ],
                    ),
                  ),


                ),*/

                SizedBox(height: 20,),

                Padding(padding: EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  width: double.infinity,
                  //padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(6)),
                  child:     MyButton(text: "Create Account", color: Colors.green, width: 500,
                      onpress: () {
                        //    if (_formKey.currentState!.validate()) {
                        //Check if user exists before sign in here

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return SignUpScreen();
                            }));
                        // }
                      }
                  ),
                ),),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.black),
                        borderRadius: BorderRadius.circular(6)),
                    //padding: EdgeInsets.all(10),
                    //width: MediaQuery.of(context).size.width*0.25,
                    alignment: Alignment.center,
                    child:    MyButton(text: "Sign In", width: 500,
                        onpress: () {
                          //    if (_formKey.currentState!.validate()) {
                          //Check if user exists before sign in here

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                          // }
                        }
                    ),
                  ),
                ),

                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
    );
  }
}

final List<OnBoardMod> demo_data = [
  OnBoardMod(
    image: "assets/images/house_locationBW.png",
    title1: "Get",
    title2:"Homes",
    description: "Quatr makes finding your dream house a quick and simple process.",
  ),
  OnBoardMod(
    image: "assets/images/fist_bump_gestureBW.png",
    title1: "Room",
    title2:"Mates",
    description: "Connect with like-minded Roommates effortlessly.",
  ),
  /*OnBoardMod(
    image: "assets/images/credit_cardBW.png",
    title1: "Pay",
    title2:"Rent",
    description: "We make paying rent effortless, allowing you to focus on what matters.",
  ),*/
  OnBoardMod(
    image: "assets/images/okay_hand_gestureBW.png",
    title1: "Too",
    title2:"Easy",
    description: "Explore thousands of listings and find your ideal home with ease.",
  ),
];

class OnboardContent extends StatefulWidget {
  const OnboardContent({
    super.key,
    required this.size,
    required this.image,
    required this.description,
    required this.title1,
    required this.title2,
  });

  final Size size;
  final String image, title1, title2, description;

  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(16),
          decoration:
          BoxDecoration(
            color: Colors.green[50], shape: BoxShape.circle,),
            child: Image.asset(widget.image, height: widget.size.height * 0.25, )),
        const SizedBox(height: 10),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

               Padding(
                 padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                 child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                        widget.title1,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                          fontSize: 30
                            ),
                    ),
                          const SizedBox(
                            width: 10,
                          ),
                    Text(
                        widget.title2,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.w900,
                          fontSize: 30
                            ),
                    ),
                  ]),
               ),



             Padding(
               padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 40),
               child: Text(widget.description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w300,
                        fontSize: 15
                          )),
             ),

            ],
          ),

      ],
    );
  }
}
