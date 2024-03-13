import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class CheckThePassword extends StatefulWidget {
  final double strength;
  final bool hascharacter;
  final bool numberofCharacters;
  final bool includeNumbers;
  const CheckThePassword(
      {super.key,
      required this.strength,
      required this.hascharacter,
      required this.numberofCharacters,
      required this.includeNumbers});

  @override
  State<CheckThePassword> createState() => _CheckThePasswordState();
}

class _CheckThePasswordState extends State<CheckThePassword> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(left: widthSize(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: heightSize(21),
              width: widthSize(232),
              child: Row(
                children: [
                  Text(
                    "Password Strength",
                    style: TextStyle(
                        fontSize: fontSize(14), fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: widthSize(10)),
                  SizedBox(
                    height: heightSize(10),
                    width: widthSize(100),
                    child: LinearProgressIndicator(
                      value: widget.strength,
                      backgroundColor: Colors.grey[300],
                      color: widget.strength <= 1 / 4
                          ? Colors.red
                          : widget.strength == 2 / 4
                              ? Colors.yellow
                              : widget.strength == 3 / 4
                                  ? Colors.orange
                                  : Colors.green,
                      minHeight: heightSize(10),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: heightSize(21)),
            Row(
              children: [
                Container(
                  height: heightSize(31),
                  width: widthSize(146),
                  padding: EdgeInsets.symmetric(
                      horizontal: widthSize(10), vertical: heightSize(5)),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: widget.hascharacter
                          ? const Color.fromRGBO(61, 64, 128, 0.1)
                          : const Color.fromRGBO(235, 87, 87, 0.05)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Icon(
                            Icons.check,
                            color: widget.hascharacter ? maincolor : Colors.red,
                          ),
                        ),
                        SizedBox(width: widthSize(4)),
                        Text(
                          "1 special character",
                          style: TextStyle(
                              fontSize: fontSize(12),
                              fontWeight: FontWeight.w400,
                              color:
                                  widget.hascharacter ? maincolor : Colors.red),
                        )
                      ]),
                ),
                SizedBox(width: widthSize(10)),
                Container(
                  height: heightSize(31),
                  width: widthSize(146),
                  padding: EdgeInsets.symmetric(
                      horizontal: widthSize(10), vertical: heightSize(5)),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: widget.includeNumbers
                          ? const Color.fromRGBO(61, 64, 128, 0.1)
                          : const Color.fromRGBO(235, 87, 87, 0.05)),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: widget.includeNumbers ? maincolor : Colors.red,
                        ),
                        SizedBox(width: widthSize(4)),
                        Text(
                          "Include A Number",
                          style: TextStyle(
                              fontSize: fontSize(12),
                              fontWeight: FontWeight.w400,
                              color: widget.includeNumbers
                                  ? maincolor
                                  : Colors.red),
                        )
                      ]),
                )
              ],
            ),
            SizedBox(height: heightSize(10)),
            Container(
              height: heightSize(31),
              width: widthSize(146),
              padding: EdgeInsets.symmetric(
                  horizontal: widthSize(10), vertical: heightSize(5)),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: widget.numberofCharacters
                      ? const Color.fromRGBO(61, 64, 128, 0.1)
                      : const Color.fromRGBO(235, 87, 87, 0.05)),
              child: Row(children: [
                Icon(
                  Icons.check,
                  color: widget.numberofCharacters ? maincolor : Colors.red,
                ),
                SizedBox(width: widthSize(4)),
                Text(
                  "8 characters",
                  style: TextStyle(
                      color:
                          widget.numberofCharacters ? maincolor : Colors.red),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
