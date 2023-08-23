import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function (bool)? onChanged;

   SmartDeviceBox({super.key, 
  required this.iconPath, 
  required this.powerOn, 
  required this.smartDeviceName,
  required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900]:
           Colors.grey[400],
        borderRadius: BorderRadius.circular(12),
        ),

        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
    
            //icon 
            Image.asset(iconPath,
            height: 65,
             color: powerOn ? Colors.white : Colors.black,
            ),

            //smart device name
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(smartDeviceName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: powerOn ? Colors.white : Colors.black,

                    ),
                   ),
                  ),
                ),
                 
                Transform.rotate(
                  angle: pi,
                  child: CupertinoSwitch (
                    value: powerOn,
                    onChanged: onChanged,
                  ),
                ),
              ],
            ),

    
          ],
        ),
    
      ),
    );
  }
}