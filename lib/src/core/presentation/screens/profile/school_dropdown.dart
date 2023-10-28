import 'package:flutter/material.dart';

class School {
  final String name;

  School({required this.name});
}

class SchoolDropdown extends StatefulWidget {
  @override
  _SchoolDropdownState createState() => _SchoolDropdownState();
}

class _SchoolDropdownState extends State<SchoolDropdown> {
  List<School> schools = [
    School(name: 'University of Lagos'),
    School(name: 'Obafemi Awolowo University'),
    School(name: 'Ahmadu Bello University'),
    School(name: 'University of Nigeria, Nsukka'),
    School(name: 'University of Ibadan'),
    School(name: 'Federal University of Technology, Minna'),
    School(name: 'University of Benin'),
    School(name: 'University of Ilorin'),
    School(name: 'University of Abuja'),
    School(name: 'Federal University of Technology, Akure'),
  ];

  School? selectedSchool;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30),
      height: 50,
      child: DropdownButton<School>(
        value: selectedSchool,
        onChanged: (School? newValue) {
          setState(() {
            selectedSchool = newValue;
          });
        },
        items: schools.map((School school) {
          return DropdownMenuItem<School>(
            alignment: Alignment.center,
            value: school,
            child: Text(school.name),
          );
        }).toList(),
      ),
    );
  }
}

