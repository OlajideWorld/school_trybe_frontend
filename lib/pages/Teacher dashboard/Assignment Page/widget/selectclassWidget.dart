import 'package:flutter/material.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';
import '../../SIgn-In Page/controller/registrationController.dart';

final RegistrationController controller = RegistrationController.instance;
selectClassOptions(
  BuildContext context,
  String selectClass,
) {
  return Container(
    height: heightSize(85),
    width: widthSize(368),
    padding: EdgeInsets.only(
        top: heightSize(13),
        right: widthSize(22),
        left: widthSize(24),
        bottom: heightSize(13)),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            blurRadius: widthSize(10),
            color: const Color.fromRGBO(61, 64, 128, 0.2),
          )
        ],
        color: whitecolor),
    child: Row(children: [
      Container(
        width: widthSize(60),
        height: heightSize(60),
        decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage(controller.schoolModel.value.image),
              fit: BoxFit.fill,
            ),
            shape: const OvalBorder()),
      ),
      SizedBox(width: widthSize(5)),
      Text(
        selectClass,
        style: TextStyle(
            fontSize: fontSize(16),
            fontWeight: FontWeight.w600,
            color: maincolor),
      ),
      const Spacer(),
      Icon(
        Icons.arrow_forward_ios,
        size: heightSize(15),
        color: maincolor,
      )
    ]),
  );
}
