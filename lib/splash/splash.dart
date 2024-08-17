import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Looks',
                  style: TextStyle(
                      fontFamily: 'Calistoga',
                      fontSize: 50,
                      color: Colors.white,
                  )
              ),
              Text(
                  'Cosmetics',
                  style: TextStyle(
                      fontFamily: 'Calistoga',
                      fontSize: 50,
                      color: Colors.white,
                  )
              ),
              Center(
                child: Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffBFBFBF).withOpacity(0.54),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.circle, size: 15),
                        SizedBox(width: 7),
                        Icon(Icons.circle, size: 15, color: Colors.black26,)
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                       Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: Center(
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontFamily: 'InriaSerif',
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, '/signin');
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2)
                        ),
                        child: Center(
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                                fontFamily: 'InriaSerif',
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
