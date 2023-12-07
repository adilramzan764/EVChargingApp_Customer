import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/Widgets/CustomTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomWidgets.dart';
import '../SignIn/SignIn.dart';

class VehicleDetails extends StatefulWidget {
   VehicleDetails({Key? key}) : super(key: key);

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  List<String> brandicons =[
    'assets/audi.svg',
    'assets/tesla.svg',
    'assets/ferrari.svg',
    'assets/bmw.svg',

    'assets/porsche.svg',

  ];

   List<String> brandnames =[
     'Audi',
     'Tesla',
     'Ferarri',
     'BMW',
     'Porshe',

   ];
  int selectedBrandIndex = 0; // Initialize with -1 to indicate no selection
  TextEditingController model=TextEditingController();
  TextEditingController trim=TextEditingController();
  TextEditingController batterycapacity=TextEditingController();
  TextEditingController firstname=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.06,),

            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Transform.scale(
                  scale: 1.4,
                  child: SvgPicture.asset('assets/back.svg')),),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.06,),
            Center(child: Text('Enter Your Vehicle Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Center(child: Text('It will create a personalized profile for you,',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,)),
            Center(child: Text(' enabling a tailored experience!',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,)),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Align(
              alignment: Alignment.centerLeft,
              child:             Text('Brands',style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),

            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.005,),
      Container(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: brandicons.length, // Replace with the actual number of items
          itemBuilder: (context, index) {
            // Access your data and create the widget
            String icon = brandicons[index]; // Replace with how you access icon data
            String brandname = brandnames[index]; // Replace with how you access brandname data
            final isSelected = selectedBrandIndex == index;

            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                  onTap: (){
                    setState(() {
                      selectedBrandIndex = index;
                    });
                  },
                  child: Carbrands_SignupWidget(icon, brandname,isSelected)),
            );
          },
        ),
      ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),

            Align(
              alignment: Alignment.centerLeft,
              child:             Text('Model',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),

            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),

            CustomTextField( hinttext: "Model X", controller: model,),

            SizedBox(height: MediaQuery.of(context).size.height*0.01,),

            Align(
              alignment: Alignment.centerLeft,
              child:             Text('Trim',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),

            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),

            CustomTextField( hinttext: "40 w supercharger", controller: trim,),

            SizedBox(height: MediaQuery.of(context).size.height*0.01,),

            Align(
              alignment: Alignment.centerLeft,
              child:             Text('Battery capacity',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),

            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),

            CustomTextField( hinttext: "600 HP", controller: batterycapacity,),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),

            Container(
              height: 32,
              width: 140,
              child: CustomButton(text: 'Next', onPressed: (){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()), // Replace NewScreen with the screen you want to navigate to
                      (Route<dynamic> route) => false, // This function defines the condition for removal
                );
              }),
            ),









          ],
        ),
      ),
    );
  }
}
