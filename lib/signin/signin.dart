import 'package:flutter/material.dart';
import 'package:lookscosmetics/signin/app_text_field.dart';
import 'package:lookscosmetics/signin/social_media_icon.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/signin.png'), // Replace with your image path
                      fit: BoxFit.cover,
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
                  )
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
                      children:  [
                        //sign in
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 10),

                        //email text field
                        AppTextField(label: "Email", obscureText: false),

                        //pwd text field
                        AppTextField(label: "Password", obscureText: true),

                        //forget password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "Forgot Your Password?",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                            )
                          ],
                        ),

                        //sign in
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/dashboard');
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xffDCA47C)
                            ),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              ),
                            ),
                          ),
                        ),

                        //or divider
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 20),
                                  height: 1,
                                  color: Colors.black,
                                )
                            ),
                            Text('or'),
                            Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 1,
                                  color: Colors.black,
                                )
                            ),
                          ],
                        ),

                        //social media
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SocialMediaIcon(image: 'images/facebook.png'),
                              SocialMediaIcon(image: 'images/google.png'),
                              SocialMediaIcon(image: 'images/apple.png'),
                            ],
                          ),
                        ),

                        //don't have an account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                            ),
                            SizedBox(width: 5,),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(context, '/signup');
                              },
                              child: Text(
                                "Sign Up",
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
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}