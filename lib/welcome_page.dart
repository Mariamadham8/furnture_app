import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'HomwPage.dart';
import 'Model.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  File? image;
  final picker =ImagePicker();


  void imagepick() async{
    final pickedimg =  await picker.pickImage(source:ImageSource.gallery);
    if(pickedimg !=null){
      image=File(pickedimg.path);
      setState(() {

      });
    }

  }

  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // شاشتك الرئيسية
      );
    });


  }


  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserInfo>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CustomCurve(),
                child: Container(
                  width: 400,
                  height: 200,
                  color: Colors.brown,
                ),
              ),

            ],
          ),

           Column(

              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    "assets/Yo Hello GIF.gif",
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "Welcome, ${userProvider.name}! Add Your Photo Please <3",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ],
            ),

          FloatingActionButton(
            child: Icon(Icons.camera_alt,color: Colors.white,),
              onPressed: (){
                imagepick();

          })

        ],
      ),
    );
  }
}

class CustomCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.5,
      size.width * 0.5,
      size.height * 0.75,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 1,
      size.width,
      size.height * 0.75,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
