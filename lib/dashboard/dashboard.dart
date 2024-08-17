import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _page = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color(0xffDCA47C),
        color: Color(0xffDCA47C),
        index: 2,
        items: <Widget>[
          Image.asset('images/Foundation.png', width: 40),
          Image.asset('images/lipstick.png', width: 40),
          Image.asset('images/Home.png', width: 40),
          Image.asset('images/Paint.png', width: 40),
          Image.asset('images/Idea.png', width: 40),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
               child: Column(
                 children: [
                   //hello and user
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       //hello and slang
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: const [
                           Row(
                             children: [
                               Baseline(
                                 baseline: 70.0, // Set the desired baseline value
                                 baselineType: TextBaseline.alphabetic,
                                 child: Text(
                                   "Hello",
                                   style: TextStyle(
                                     fontFamily: 'Poppins',
                                     fontSize: 25,
                                     color: Colors.black,
                                   ),
                                 ),
                               ),
                               Baseline(
                                 baseline: 70.0, // Set the same baseline value
                                 baselineType: TextBaseline.alphabetic,
                                 child: Text(
                                   " Aura,",
                                   style: TextStyle(
                                     fontFamily: 'Poppins',
                                     fontSize: 45,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                   ),
                                 ),
                               ),
                             ],
                           ),
                           Text(
                             'Feel the Vibe, Own the Look',
                             style: TextStyle(
                                 fontFamily: 'Poppins',
                                 fontSize: 12,
                                 color: Colors.black
                             ),
                           )
                         ],
                       ),
                       //user
                       Container(
                           padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                               color: Colors.black,
                               borderRadius: BorderRadius.circular(50)
                           ),
                           child: Icon(
                               Icons.person,
                               size: 35,
                               color: Colors.white
                           )
                       ),
                     ],
                   ),
                   SizedBox(height: 20,),
                   //tip section
                   Expanded(
                     child: Material(
                       elevation: 6,
                       borderRadius: BorderRadius.circular(20),
                       child: Container(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         decoration: BoxDecoration(
                           color: Color(0x10DCA47C),
                           borderRadius: BorderRadius.circular(20),
                         ),
                         width: double.infinity,
                         child: Row(
                           children: [
                             Text(
                               'YOUR RECENT \nTIP IS HERE',
                                style: TextStyle(
                                  color: Color(0xffDCA47C),
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                ),
                             ),
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                               height: 1000,
                               width: 2,
                               color: Color(0xffDCA47C),
                             ),
                             Expanded(
                               child: Text(
                                 'For a quick glow, apply a cold compress or splash your ...',
                                 softWrap: true,
                                 style: TextStyle(
                                   color: Colors.black,
                                   fontFamily: 'Poppins',
                                   fontSize: 13,
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                   )
                 ],
               ),
             ),
              SizedBox(height: 30,),
              Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        //foundation and lipstick
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/apply-foundation');
                                },
                                child: Material(
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        width: 200,
                                        height: MediaQuery.of(context).size.height * 0.35,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Apply \nFoundation',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 20,
                                                ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          left: -10,
                                          child: Image.asset('images/found.png', fit: BoxFit.cover,)
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/apply-lipstick');
                                },
                                child: Material(
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        width: 200,
                                        height: MediaQuery.of(context).size.height * 0.35,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Apply \nLipstick',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Poppins',
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          top: 0,
                                          right: -20,
                                          child: Image.asset('images/lip.png', fit: BoxFit.cover,)
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        //eyeliner and tips
                        Row(
                          children: [
                            Expanded(
                              child: Material(
                                elevation: 10,
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      width: 200,
                                      height: MediaQuery.of(context).size.height * 0.35,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Apply \nEyeliner',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        bottom: -10,
                                        right: -20,
                                        child: Image.asset('images/eye.png', fit: BoxFit.cover,)
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: Material(
                                elevation: 10,
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      width: 200,
                                      height: MediaQuery.of(context).size.height * 0.35,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Apply \nLipstick',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Image.asset('images/bt.png', fit: BoxFit.cover,)
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50,),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
