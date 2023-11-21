import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/View/SignIn/SignIn.dart';
import 'package:evchargingapp/Widgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Starter2 extends StatelessWidget {
  const Starter2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height *0.65,
            width: double.infinity,
            child: Image.asset('assets/startter2.png',fit: BoxFit.cover,),
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
                  Text('Welcome to the EV Charging',style: TextStyle(color: Colors.black,fontSize: 18),),
                  SizedBox(height: 3,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Revolution:',style: TextStyle(color: Colors.black,fontSize: 18),),
                      Text(' Your Charge Awaits!',style: TextStyle(color: ColorValues.green,fontSize: 18),),

                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('Unveil a world of convenience, from personalized profiles to hourly fees, energy rewards, and in-app payments ',style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 11),textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Icon(Icons.circle,color: Colors.grey.withOpacity(0.3),size: 11,),
                      SizedBox(width: 8,),

                      SvgPicture.asset('assets/current.svg'),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButton(text: 'Next', onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(), // Replace with your next screen widget.
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
