import 'package:flutter/material.dart';
import 'upper_part.dart';
import 'section_part.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical History',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFE9E9E9),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UpperPart(),
              SizedBox(height: 20),
              SectionPart(
                title: 'Allergies',
                date: 'Monday, 27 March 2023',
                headingName: 'Allergies',
                totalRecords: 4,
                sampleData: ['Peanuts Allergies', 'Pollen'],
                sampleStatus: ['Severe', 'Mild'],
              ),
              SizedBox(height: 20),
              SectionPart(
                title: 'Existing Diseases',
                date: 'Wednesday, 10 April 2023',
                headingName: 'Disease',
                totalRecords: 6,
                sampleData: ['Diabetes', 'Hypertension', 'Asthma'],
                sampleStatus: ['Under Control', 'Active', 'Under Control'],
              ),
              SizedBox(height: 20),
              SectionPart(
                title: 'Ongoing Treatments',
                date: 'Thursday, 11 April 2023',
                headingName: 'Treatments',
                totalRecords: 8,
                sampleData: ['Insulin Therapy', 'Physical Therapy', 'Hypertension'],
                sampleDoctor: ['Dr. Waseem', 'Dr. Nadeem', 'Dr. Yusra'],
                sampleStatus: ['Active', 'Ongoing', 'Active'],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


