
import 'package:flutter/material.dart';
import 'package:screen_1/postappointment.dart';
import 'package:screen_1/screen3.dart';

class screen4 extends StatelessWidget {

@override
Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: 
      Container(
       color: Color(0xFFE5E5E5)
,
       child: 
             FutureBuilder<List<dynamic>>(
  future: fetchdoctorsinfobyid(did),
  builder: (context, snapshot) {
     if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(); // Return a loading indicator while waiting for the future
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}'); // Return an error message if the future throws an error
    } else if (!snapshot.hasData) {
      return Text('No data available'); // Return a message if the future completes successfully but has no data
    } else {
       final List<dynamic> data = snapshot.data!;
      print(data[0]);
      final item = data[0];
      print(item['DoctorName']);
      return  // Return the data if the future completes successfully and has data
    
       SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 550,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                                  color: Color(0xFF3E64FF),
                       
                      ),
                      child:
                       Column(
                        children: [
                      
                                   Padding(
                                     padding: const EdgeInsets.only(right: 340,top: 50),
                                     child: GestureDetector(
                                      onTap: (){
                                         Navigator.pop(context);
                                       },
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
                                   ),
                                      
                              Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.7),
                            blurRadius: 20, // Adjust the blur radius as needed
                            spreadRadius: 0, // Adjust the spread radius as needed
                            offset: Offset(0, 5), // Adjust the offset as needed
                          ),
                        ],
                      ),
                    )
                    
                       ,
                       SizedBox(height: 45,),
                    Text(
                                //  textAlign: TextAlign.center,
                       
                                        item['DoctorName'],
                                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'museo700',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: -0.32,
                            
                                        ))            ,
                                        Text(
                                  //textAlign: TextAlign.center,
                       
                                        item['Specialty'],
                                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'museo700',
                          //  fontWeight: FontWeight.w800,
                            height: 0,
                            letterSpacing: -0.32,
                            
                                        )),
                                        SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 160,
                                width: 120,
                                decoration: BoxDecoration(
                     color: const Color.fromARGB(255, 255, 255, 255),
                     borderRadius: BorderRadius.circular(20)
                                ),
                               child: Column(children: [
                                Container(
                                  height:80,
                                  width:80,
                                  child:
                                   Image.asset('assets/icons/patientdealt.png')),
                               SizedBox(height: 20,),
                               Text(
                                 // textAlign: TextAlign.center,
                       
                                        item['PatientDealt'].toString(),
                                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(255, 5, 5, 5),
                            fontSize: 17,
                            fontFamily: 'museo700',
                          //  fontWeight: FontWeight.w800,
                            height: 0,
                            letterSpacing: -0.32,
                            
                                        )),
                                                                     SizedBox(height: 5,),
              
                                        Text(
                                  textAlign: TextAlign.center,
                       
                                        'Patients',
                                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(255, 128, 126, 126),
                            fontSize: 17,
                            fontFamily: 'museo500',
                          //  fontWeight: FontWeight.w800,
                            height: 0,
                            letterSpacing: -0.32,
                            
                                        )),
                               ],
                               
                               ),
              
              
              
                              ),
                              SizedBox(width: 10,),
                            
                              Container(
                                height: 160,
                                width: 120,
                                decoration: BoxDecoration(
                     color: const Color.fromARGB(255, 255, 255, 255),
                     borderRadius: BorderRadius.circular(20)
                                ),
                               child: Column(children: [
                                Container(
                                  height:80,
                                  width:80,
                                  child:
                                   Image.asset('assets/icons/experience.png')),
                               SizedBox(height: 20,),
                               Text(
                                  textAlign: TextAlign.center,
                       
                                        item['ExperienceInYears'].toString(),
                                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(255, 5, 5, 5),
                            fontSize: 17,
                            fontFamily: 'museo700',
                          //  fontWeight: FontWeight.w800,
                            height: 0,
                            letterSpacing: -0.32,
                            
                                        )),
                                                                     SizedBox(height: 5,),
              
                                        Text(
                                  textAlign: TextAlign.center,
                       
                                        'Experience',
                                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(255, 128, 126, 126),
                            fontSize: 17,
                            fontFamily: 'museo500',
                          //  fontWeight: FontWeight.w800,
                            height: 0,
                            letterSpacing: -0.32,
                            
                                        )),
                               ],
                               
                               ),
              
              
              
                              ),
                           
                          SizedBox(width: 10,),
                          
                              Container(
                                height: 160,
                                width: 120,
                                decoration: BoxDecoration(
                     color: const Color.fromARGB(255, 255, 255, 255),
                     borderRadius: BorderRadius.circular(20)
                                ),
                               child: Column(children: [
                                Container(
                                  height:80,
                                  width:80,
                                  child:
                                   Image.asset('assets/icons/ratings.png')),
                               SizedBox(height: 20,),
                               Text(
                                 // textAlign: TextAlign.center,
                       
                                        item['Rating'].toString(),
                                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(255, 5, 5, 5),
                            fontSize: 17,
                            fontFamily: 'museo700',
                          //  fontWeight: FontWeight.w800,
                            height: 0,
                            letterSpacing: -0.32,
                            
                                        )),
                                                                     SizedBox(height: 5,),
              
                                        Text(
                                  textAlign: TextAlign.center,
                       
                                        'Ratings',
                                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(255, 128, 126, 126),
                            fontSize: 17,
                            fontFamily: 'museo500',
                          //  fontWeight: FontWeight.w800,
                            height: 0,
                            letterSpacing: -0.32,
                            
                                        )),
                               ],
                               
                               ),
              
              
              
                              ),
                           
                            ],
                          ) ,
                            
                                        
                                      
                                      
                                          ]
                      )
                              
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(width: double.infinity,
                                      //  height: 500,
                                       // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text(
                                      textAlign: TextAlign.center,
                           
                                            'About Doctor',
                                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 21,
                                fontFamily: 'museo700',
                              //  fontWeight: FontWeight.w800,
                                height: 0,
                                letterSpacing: -0.32,
                                
                                            )),
                         ),
                                           Padding(
                                             padding: const EdgeInsets.only(left:(8.0)),
                                             child: Container(
                                              width: 400,
                                               child: Text(
                                                                          //     textAlign: TextAlign.start,
                                                                    item['Descriptions'],
                                                                                     style: TextStyle(
                                                                         decoration: TextDecoration.none,
                                                                         color: Color(0xFF444444),
                                                                         fontSize: 17,
                                                                         fontFamily: 'museo500',
                                                                       //  fontWeight: FontWeight.w800,
                                                                         height: 0,
                                                                         letterSpacing: 0.23,
                                                                        
                                                                         
                                                                                     )),
                                             ),
                                           ),
                                            Padding(
                           padding: const EdgeInsets.only(left: 8,top: 15,bottom: 8),
                           child: Text(
                                      textAlign: TextAlign.center,
                           
                                            'Working time',
                                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 21,
                                fontFamily: 'museo700',
                              //  fontWeight: FontWeight.w800,
                                height: 0,
                                letterSpacing: -0.32,
                                
                                            )),
                         ),
                          Padding(
                           padding: const EdgeInsets.only(left: 8.0),
                           child: Text(
                                     // textAlign: TextAlign.center,
                           
                                            item['Working_Time'],
                                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: const Color.fromARGB(255, 50, 50, 50),
                                fontSize: 18,
                                fontFamily: 'museo500',
                              //  fontWeight: FontWeight.w800,
                                height: 0,
                                letterSpacing: -0.32,
                                
                                            )),
                                            
                      
                         ),
                          Padding(
                           padding: const EdgeInsets.only(left:8.0,top: 15),
                           child: Text(
                                      textAlign: TextAlign.center,
                           
                                            'Communication',
                                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 21,
                                fontFamily: 'museo700',
                              //  fontWeight: FontWeight.w800,
                                height: 0,
                                letterSpacing: -0.32,
                                
                                            )),
                                            
                      
                         ),
                      
                         
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(width: 300,
                           height: 80,
                                               // color: Colors.green,
                           child: Row(children: [
                            Image.asset('assets/icons/messaging.png'),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            SizedBox(height: 15,),
                             Text(
                                        textAlign: TextAlign.center,
                             
                                              'Messaging',
                                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color(0xFF222B45),
                                  fontSize: 18,
                                  fontFamily: 'museo700',
                                //  fontWeight: FontWeight.w800,
                                  height: 0,
                                  letterSpacing: -0.32,
                                  
                                              )),
                              Text(
                                        textAlign: TextAlign.center,
                             
                                              'Chat me up, share photos.',
                                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color(0xFF6B779A)
                           
                           ,
                                  fontSize: 15,
                                  fontFamily: 'museo700',
                                //  fontWeight: FontWeight.w800,
                                  height: 0,
                                  letterSpacing: -0.32,
                                  
                                              )),
                            ],)
                           ],),
                           
                           ),
                         ),
                           
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(width: 300,
                           height: 80,
                                               // color: Colors.green,
                           child: Row(children: [
                            Image.asset('assets/icons/audiocall.png'),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            SizedBox(height: 15,),
                             Text(
                                        textAlign: TextAlign.center,
                             
                                              'Audio Call',
                                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color(0xFF222B45),
                                  fontSize: 18,
                                  fontFamily: 'museo700',
                                //  fontWeight: FontWeight.w800,
                                  height: 0,
                                  letterSpacing: -0.32,
                                  
                                              )),
                              Text(
                                        textAlign: TextAlign.center,
                             
                                              'Call your doctor directly.',
                                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color(0xFF6B779A)
                           
                           ,
                                  fontSize: 15,
                                  fontFamily: 'museo700',
                                //  fontWeight: FontWeight.w800,
                                  height: 0,
                                  letterSpacing: -0.32,
                                  
                                              )),
                            ],)
                           ],),
                           
                           ),
                         ),
                           
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(width: 300,
                           height: 80,
                                               // color: Colors.green,
                           child: Row(children: [
                            Image.asset('assets/icons/videocall.png'),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            SizedBox(height: 15,),
                             Text(
                                        textAlign: TextAlign.center,
                             
                                              'Video Call',
                                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color(0xFF222B45),
                                  fontSize: 18,
                                  fontFamily: 'museo700',
                                //  fontWeight: FontWeight.w800,
                                  height: 0,
                                  letterSpacing: -0.32,
                                  
                                              )),
                              Text(
                                        textAlign: TextAlign.center,
                             
                                              'See your doctor live.',
                                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color(0xFF6B779A)
                           
                           ,
                                  fontSize: 15,
                                  fontFamily: 'museo700',
                                //  fontWeight: FontWeight.w800,
                                  height: 0,
                                  letterSpacing: -0.32,
                                  
                                              )),
                            ],)
                           ],),
                           
                           ),
                         ),
                          
                          Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                      
                           )
                                            
                      
                         ),
                         Center(
                           child: Container(width: 300,
                           height: 70,
                           child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 primary: const Color(0xFF0E67B8),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(25.0),
                                 ),
                               ),
                               onPressed: () {
                                 // Add your onPressed logic here.
                               },
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   SizedBox(width: 10,),
                                   const Text('Book Appointment',style: TextStyle(fontFamily: 'nunito-extrabold',fontSize: 20,color: Colors.white),),
                                SizedBox(width: 10,),
                                Image.asset('assets/icons/arrowforward.png')
                                 ],
                               ),
                             ),),
                         )
                         ,SizedBox(height: 10,)
                        ],
                      ),
                      
                      ),
                    )
              
                  ],
                ),
              );
    
    }
  }
            )
         ,
      ),
    );
  } 

}