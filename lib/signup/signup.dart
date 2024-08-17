import 'package:flutter/material.dart';

import '../signin/app_text_field.dart';
import '../signin/social_media_icon.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Transform.translate(
                  offset: Offset(0, 0), // Move the image down
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/signup.png'),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    // Add any child widgets here if needed
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //sign in
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      //email text field
                      AppTextField(label: "Email", obscureText: false),

                      //name
                      Row(
                        children: const [
                          Expanded(
                            child: AppTextField(label: "First Name", obscureText: false),
                          ),
                          SizedBox(width: 10), // Add some spacing between the text fields
                          Expanded(
                            child: AppTextField(label: "Last Name", obscureText: false),
                          ),
                        ],
                      ),

                      //pwd text field
                      AppTextField(label: "Password", obscureText: true),

                      //confirm pwd text field
                      AppTextField(label: "Confirm Password", obscureText: true),

                      //sign in
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xffDCA47C),
                        ),
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),

                      //don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Have an Account?",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/signin');
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xff37B7C3),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
