import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/util/smart_devices_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //padding constants
  final double horizontalPadding = 40;
  final double verticalPadding= 25;

  List mySmartDevices = [
    ["Luminaria", "lib/icons/luminaria.png", true],
    ["Ar-Condicionado", "lib/icons/ar-condicionado.png", false],
    ["Smart-Tv", "lib/icons/smart-tv.png", false],
    ["Ventilador", "lib/icons/ventilador.png", false],
  ];

  //power button switched 
  void powerSwitchChanged (bool value, int index) {
    setState(() {
      mySmartDevices [index][2] = value;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        body: SafeArea(
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //custom app bar 
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: horizontalPadding ,
                    vertical: verticalPadding,
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //menu icon
                      Image.asset('lib/icons/cardapio.png',
                      height: 45,
                      color:Colors.grey [800] ,
                      ),
                
                      //acount icon
                      Icon(
                        Icons.person,
                        size: 45,
                        color: Colors.grey [800],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),


                //welcome home
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding ,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text('Seja Bem-vinda',),
                      Text('Emilia',
                      style: GoogleFonts.bebasNeue (),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                
                //smart device + grid 
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Text('Smart Devices',),
                ),

                Expanded(child: GridView.builder(
                  itemCount: mySmartDevices.length,
                  padding: const EdgeInsets.all(29),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.3,
                  ),


                  itemBuilder: (context, index) {
                    return SmartDeviceBox(
                      smartDeviceName: mySmartDevices [index][0],
                      iconPath: mySmartDevices[index][1],
                      powerOn: mySmartDevices[index][0],
                      onChanged: (value) => powerSwitchChanged (value, index),
                      
                    );
                   }, 

                  ),
                 ),





         ],
        ),         
      ),
    );
  }
}