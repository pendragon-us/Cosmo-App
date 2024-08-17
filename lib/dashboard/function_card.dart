import 'package:flutter/material.dart';

class FunctionCard extends StatelessWidget {

  final String title;
  final String image;
  final String route;

  const FunctionCard({
    super.key,
    required this.title,
    required this.image,
    required this.route
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
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
                      title,
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
                  child: Image.asset(image, fit: BoxFit.cover,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
