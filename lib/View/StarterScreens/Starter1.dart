import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/View/StarterScreens/Starter2.dart';
import 'package:evchargingapp/Widgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Starter1 extends StatelessWidget {
  const Starter1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height *0.65,
            width: double.infinity,
            child: Image.asset('assets/starter1.png',fit: BoxFit.cover,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height*0.45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70),topLeft: Radius.circular(70),)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Join the',style: TextStyle(color: Colors.black,fontSize: 18),),
                      Text(' Electric Revolution',style: TextStyle(color: ColorValues.green,fontSize: 18),),

                    ],
                  ),
                  SizedBox(height: 3,),
                  Text('with EV Charge Share',style: TextStyle(color: Colors.black,fontSize: 18),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('From simple registration to hourly fees and energy rewards, we have  got it all! ',style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 11),textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/current.svg'),
                      SizedBox(width: 8,),
                      Icon(Icons.circle,color: Colors.grey.withOpacity(0.3),size: 11,)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButton(text: 'Next', onPressed: (){
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return Starter2();
                          },
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOut;
                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    }),
                  )




                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
