import 'package:flutter/material.dart';
import 'package:furnture_app/widgets/TextBox.dart';
import 'package:provider/provider.dart';
import 'welcome_page.dart';
import 'Model.dart';




class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name =TextEditingController();
    TextEditingController mail =TextEditingController();
    TextEditingController pass =TextEditingController();
    TextEditingController number =TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
                children: [
                  ClipPath(
                    clipper:CustumCurve(),
                    child: Container(
                      width: 400,
                      height: 200,
                      color: Colors.brown,
                    ),
                  ),
                  Align(
                   alignment: Alignment(4, 180),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  )

                ],
          ),

          CustomTextField(controller: name,label:"Name",hint: "Enter Your Name",),
          SizedBox(height: 6,),
          CustomTextField(controller: mail,label:"Mail",hint: "Enter Your mail",),
          SizedBox(height: 6,),
          CustomTextField(controller: pass,label:"Password",hint: "Enter Your Password",),
          SizedBox(height: 6,),
          CustomTextField(controller: number,label:" Mobile number",hint: "Enter Your Mobile",),
          SizedBox(height: 6,),
          SizedBox(
            width: 200,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                final userProvider =
                Provider.of<UserInfo>(context, listen: false);

                userProvider.setName(name.text);
                userProvider.setEmail(mail.text);
                userProvider.setpass(pass.text);
                userProvider.setnum(number.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Data Saved to Provider")),
                );
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Welcome(),));
              },
             // color: Colors.brown,
              child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

            ),
          ),

        ]
      )


    );
  }
}
class CustumCurve extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path =Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.25 ,
        size.height * 0.5 ,
        size.width * 0.5 ,
        size.height * 0.75
    );

    path.quadraticBezierTo(
        size.width * 0.75 ,
        size.height * 1 ,
        size.width  ,
        size.height * 0.75
    );
    path.lineTo( size.width,0);

   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
       return true ;
  }

}


