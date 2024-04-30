import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screen_1/postappointment.dart';
import 'package:intl/intl.dart';
List<String> timeSlots = [
  '9:00 AM',
  '12:00 AM',
  '3:00 PM',
  '6:00 PM',
  '9:00 PM',
  '12:00 PM',
  '3:00 AM',
  '6:00 AM',
];
var selectedDate;


List<DateTime> getNext10Days() {
  List<DateTime> dates = [];
  DateTime today = DateTime.now();
  for (int i = 0; i < 10; i++) {
    dates.add(today.add(Duration(days: i)));
  }

  return dates;
}

class screen2 extends StatefulWidget{


  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {
String? selectedAge;
var age;
var name;
var app_time;
var app_date;
var gender;
var complain = 'None';
  List<int> selecteddateindices = [];
 // List<int> selectedtimeindices = [];

List<String> ages = ['10-20', '21-30', '31-40', '41-50', '51-60', '61-70', '71-80', '81-90', '91-100'];
int _Selectedtimeindex = -1;
 int _selectedIndex = -1;
int selecteddate = -1;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController complaincontroller = TextEditingController();
var selectedgender ;
List<DateTime> next10Days = getNext10Days();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 73, 59, 59),
       // height: 100,
        child: Container(
      color: Color.fromARGB(255, 218, 217, 217),
      //height: 100,
     child:
      
       SingleChildScrollView(
         child: Column(
          children: [

            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                          color: Color(0xFF3E64FF),
               
              ),
              child:
               Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 70,right: 0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30,bottom: 55),
                          child: Container(
                                      width: 48,
                                      height: 48,
                                      padding: const EdgeInsets.all(12),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(18),
                          
                                        ),
                                      ),
                                      child:Icon(Icons.arrow_back,color: Colors.white,) ,
                          ),
                        ),
                     
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      width:225 ,
                      child: Text(
                          textAlign: TextAlign.center,
               
                                'Book Your Appointment',
                                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'nunito-extrabold',
                    fontWeight: FontWeight.w800,
                    height: 0,
                    letterSpacing: -0.32,
                    
                                )),
                    ),
                  ),
                 
                      ],
                    )
                ),       
            
                ]
              )
          
            )
          , 
          Container(
              height: 150,
              width: double.infinity,
             // color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               Padding(
          padding: const EdgeInsets.only(left: 15,top: 10),
          child: Text(
                    'April, 2024',
                                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontFamily: 'nunito-extrabold',
                      fontWeight: FontWeight.w800,
                      height: 0,
                      letterSpacing: -0.32,
                                  )),
               ),
               SizedBox(height: 9,)
               
               ,Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children:
          
           List.generate(5, (index) {
            

            
            bool isSelected = selecteddateindices.contains(index);

               return GestureDetector(
                onTap: () {
                selectedDate = DateFormat('yyyy-MM-dd').format(next10Days[index]);

                  setState(() {
                    if (isSelected)
                    selecteddateindices.remove(index);
                    else
                      selecteddateindices = [index];
                  });
                  print(selectedDate.toString());
                },
                 child: Padding(
                           padding: const EdgeInsets.all(0.0),
                           child: Container(
                             width: 70, // Adjust the width as needed
                             height: 95, // Adjust the height as needed
                             decoration: BoxDecoration(
                             color:isSelected? Color(0xFF3E64FF): const Color.fromARGB(255, 252, 252, 252),
                             borderRadius: BorderRadius.circular(15)
                 
                             ),
                             child: Center(
                               child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                                        DateFormat('d').format(next10Days[index]),
                                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: isSelected? const Color.fromARGB(255, 255, 255, 255): const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 33,
                            fontFamily: 'museo500',
                           // fontWeight: FontWeight.w800,
                            height: 0,
                            letterSpacing: -0.32,
                                        )),
                 
                                        SizedBox(height: 5,),
                                        Text(
                                        DateFormat('EE').format(next10Days[index]),
                                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: isSelected? const Color.fromARGB(255, 255, 255, 255): const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                            fontFamily: 'actor',
                           // fontWeight: FontWeight.w800,
                            height: 0,
                            letterSpacing: -0.32,
                                        )),
                  ],
                               ),
                             ),
                           ),
                 ),
               );
          }),
           
               )
                ],
              ),
              
              ),
             Container(
          width: MediaQuery.of(context).size.width,
       //   color: Colors.lightGreen,

          child: 
          FutureBuilder<List<dynamic>>(
  future: getTimesByDates(1, DateTime.parse(selectedDate.toString())),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      // Display an error message if fetching data failed
      return Text('Error: ${snapshot.error}');
    } else if (snapshot.hasData) {
      // Extract the data from the snapshot
      final List<dynamic> data = snapshot.data!;
      print(data);
      return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 4,
        childAspectRatio: 2.2,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 10.0,
        children: data.map((item) {
          return GestureDetector(
            onTap: () {
              setState(() {
                // Handle onTap event
              });
            },
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white, // Adjust color based on your condition
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  item['timeofvisit'].toString(),
                  style: TextStyle(
                    fontFamily: 'museo500',
                    color: Colors.black, // Adjust color based on your condition
                    fontWeight: FontWeight.w100,
                    fontSize: 18,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      );
    } else {
      // Display a loading indicator while waiting for data
      return CircularProgressIndicator();
    }
  },
)

               )
         ,
         
               Container(
          width: double.infinity,
        //       color: const Color.fromARGB(255, 30, 169, 233),
               child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: Text(
                      'Patient Details',
                                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontFamily: 'nunito-semibold',
                        fontWeight: FontWeight.w800,
                        height: 0,
                        letterSpacing: -0.32,
                                    )),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                 child: Text(
                      'Name',
                        style: TextStyle(
                        decoration: TextDecoration.none,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontFamily: 'nunito-semibold',
                        fontWeight: FontWeight.w800,
                        height: 0,
                        letterSpacing: -0.32,
                                    )),
               ),
               Center(
          child: Container(
            height: 50,
            width: 370,
            decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10)
            ),
          child:
          RoundedTextField('Enter your name', namecontroller)
          ),
               ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                child: Text(
                      'Age',
                                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontFamily: 'nunito-extrabold',
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.32,
                                    )),
              ),
           Center(
          child: Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10)
          
            ),
            child:

DropdownButton<String>(
  
  value: selectedAge,
  items: ages.map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    
      value: value,
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 10,),
          Text(value),
          SizedBox(width: 280), // Add a gap between the text and the icon
          //Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }).toList(),
  onChanged: (String? newValue) {
    setState(() {
      selectedAge = newValue!;
    });
  },
),)
              
               ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
            child: Text(
                      'Gender',
                                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontFamily: 'nunito-semibold',
                        fontWeight: FontWeight.w800,
                        height: 0,
                        letterSpacing: -0.32,
                                    )),
          ),
         
         Row(
           children: [
            SizedBox(width: 20,),
             GestureDetector(
               onTap: () {
          setState(() {
            if (_selectedIndex == 1 || _selectedIndex == 2){
                _selectedIndex = 0;
            selectedgender='Male';
            }
           
          });
               },
             
               child: Container(
          width: 100,
          height: 60,
          decoration: BoxDecoration(
            color: _selectedIndex == 0 ? Color(0xFF3E64FF) : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child:  Center(
            child: Text(
                    "Male",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: _selectedIndex == 0 ? Colors.white : Colors.black,
                      fontFamily: "nunito-semibold",
                      fontSize: 18,
                    ),
              ),
          ),
             ),
             
             ),
          SizedBox(width: 10,),
             GestureDetector(
               onTap: () {
          setState(() {
            if (_selectedIndex == 1 || _selectedIndex == 0){
             _selectedIndex = 2;
                selectedgender = 'Female';
            }
          
               
          });
               },
             
               child: Container(
          width: 100,
          height: 60,
          decoration: BoxDecoration(
            color: _selectedIndex == 2 ? Color(0xFF3E64FF) : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child:  Center(
            child: Text(
                    "Female",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: _selectedIndex == 2 ? Colors.white : Colors.black,
                      fontFamily: "nunito-semibold",
                      fontSize: 18,
                    ),
              ),
          ),
             ),
             
             ),
           ],
         ),   
         Padding(
           padding: const EdgeInsets.only(top: 20),
           child: Center(
             child: Container(
             height: 150,
             width: 380,
             decoration: BoxDecoration(
             color :Colors.white,
             borderRadius: BorderRadius.circular(10)
             
             ),
             child: RoundedTextField('Enter any additional comments',complaincontroller ),
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(top: 10,bottom: 20),
           child: Center(
             child: Container(
              height: 60,
              width: 300,
              child:  ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   primary: const Color(0xFF0E67B8),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(35.0),
                   ),
                 ),
                 onPressed: () {
                   name = namecontroller.text;
                   complain = complaincontroller.text;

               //   apifunction().postDataToApi('2024-12-13','13:36:28.094Z',name,age,gender,complain); // Add your onPressed logic here.
                //  print(name);
                //  print(selectedgender);
                //  print(complain);
                //  print(selectedAge);
               // List<dynamic> times = getTimesByDates( 1, DateTime.parse('2023-02-15'));
                //print(times);
                 },
                 child: Row(
                   children: [
                     SizedBox(width: 40,),
                     const Text('Search Doctors',style: TextStyle(fontFamily: 'nunito-extrabold',fontSize: 20,color: Colors.white),),
                  SizedBox(width: 10,),
                  Image.asset('assets/icons/arrowforward.png')
                   ],
                 ),
               ),
             ),
           ),
         )
          ],
               ),
         )
         
          ]
            ),
       )
       

        ),


    )
    );
  }
}


class RoundedTextField extends StatelessWidget {
  final String hintText;
  TextEditingController controller;

  // const RoundedTextField({Key? key, required this.hintText,this.icondata}) : super(key: key);

RoundedTextField(this.hintText,this.controller);
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      controller: controller,
      decoration: InputDecoration(
           border: UnderlineInputBorder(borderSide: BorderSide.none),

        hintText: hintText, hintStyle: TextStyle(
          color: Color.fromARGB(255, 31, 29, 29),
          fontFamily: 'actor'
          
          ),
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),

      ),
    );
  }
}

