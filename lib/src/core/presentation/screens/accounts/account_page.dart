import 'package:flutter/material.dart';

import '../../widgets/clickable_round_image.dart';
import '../../widgets/my_text.dart';
import '../profile/profile_screen.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 50),
              child: ListView(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
                children: [
                  ProfileHeader(),
                  Divider(thickness: 1),
                  Padding(
                    padding: EdgeInsets.only(top: 0, left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AccountSettings(),
                        SavedListings(),
                        MyApplications(),
                        FAQ(),
                        RateUs(),
                        TermsAndConditions(),
                        HelpAndSupport(),
                        SignOut(),
                      ],
                    ),
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

class SignOut extends StatelessWidget {
  const SignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.logout,
        color: Colors.red,
      ),
      title: MyText(
          text: "Sign out",
          fontSize: 16,
          color: Colors.red,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start),
    );
  }
}

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.contact_support,
        color: Colors.black,
      ),
      title: MyText(
          text: "Help & Support",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start),
    );
  }
}

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.assignment,
        color: Colors.black,
      ),
      title: MyText(
          text: "Terms & Conditions",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start),
    );
  }
}

class RateUs extends StatelessWidget {
  const RateUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.favorite,
        color: Colors.black,
      ),
      title: MyText(
          text: "Rate Us",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start),
    );
  }
}

class FAQ extends StatelessWidget {
  const FAQ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.question_answer,
        color: Colors.black,
      ),
      title: MyText(
          text: "FAQ",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start),
    );
  }
}

class MyApplications extends StatelessWidget {
  const MyApplications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.collections_bookmark_rounded,
        color: Colors.black,
      ),
      title: MyText(
          text: "My Applications",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start),
    );
  }
}

class SavedListings extends StatelessWidget {
  const SavedListings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.favorite,
        color: Colors.black,
      ),
      title: MyText(
          text: "Saved Listings",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start),
    );
  }
}

class AccountSettings extends StatelessWidget {
  const AccountSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.person,
        color: Colors.black,
      ),
      title: MyText(
          text: "Account Settings",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      },
      child: Row(
        children: [
          ClickableRoundImage(
              image: AssetImage("assets/images/boluProfile.jpg"),
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.height * 0.06,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              }),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyText(
                  text: "Shotayo Boluwatife",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                MyText(
                  text: "bolutifeakorey@gmail.com",
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
