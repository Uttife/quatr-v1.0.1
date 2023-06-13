import 'package:flutter/material.dart';

import '../../../commom_widgets/container.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Account Settings"), backgroundColor: Colors.green[300]),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left:6,right: 16,bottom: 16, top:8),
              child: ListView(
                children: [

                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyRowContainer( borderRadius: BorderRadius.circular(4),
                            paddingWContainer: EdgeInsets.all(8),
                            textFontWeight: FontWeight.bold,
                            icon: Icons.phonelink_setup, desc: "Change phone number",  padding: EdgeInsets.only(top:16,left: 6, right: 16,bottom: 6 )),
                        MyRowContainer( borderRadius: BorderRadius.circular(4),
                            paddingWContainer: EdgeInsets.all(8),
                            textFontWeight: FontWeight.bold,
                            icon: Icons.lock_rounded, desc: "Change password",   padding: EdgeInsets.only(top:16,left: 6,right: 16, bottom: 6 )),
                        MyRowContainer( borderRadius: BorderRadius.circular(4),
                            paddingWContainer: EdgeInsets.all(8),
                            textFontWeight: FontWeight.bold,
                            icon: Icons.health_and_safety_rounded, desc: "2 Factor authorisation", padding: EdgeInsets.only(top:16,left: 6,right: 16, bottom: 6 )),
                        MyRowContainer( borderRadius: BorderRadius.circular(4),
                            paddingWContainer: EdgeInsets.all(8),
                            textFontWeight: FontWeight.bold,
                            icon: Icons.person_remove, desc: "Account type",   padding: EdgeInsets.only(top:16,left: 6,right: 16, bottom: 6 )),
                        MyRowContainer( borderRadius: BorderRadius.circular(4),
                            paddingWContainer: EdgeInsets.all(8),
                            textFontWeight: FontWeight.bold,
                            icon: Icons.place, desc: "Location",  padding: EdgeInsets.only(top:16,left: 6,right: 16, bottom: 6 )),
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