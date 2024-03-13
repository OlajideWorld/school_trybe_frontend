import 'package:flutter/material.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../../../../models/student_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

final RegistrationController regController = RegistrationController.instance;

showChildren(
  StudentModel model,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: heightSize(125),
      width: widthSize(368),
      padding: EdgeInsets.only(
          top: heightSize(27),
          right: widthSize(20),
          left: widthSize(25),
          bottom: heightSize(25)),
      decoration: BoxDecoration(
          color: whitecolor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: colors1)),
      child: Row(children: [
        // Container(
        //   height: heightSize(72),
        //   width: widthSize(72),
        //   decoration: const ShapeDecoration(shape: OvalBorder()),
        //   child: Image.network(model.image),
        // ),
        CircleAvatar(
          radius: heightSize(50),
          backgroundImage: NetworkImage(model.image),
        ),
        SizedBox(width: widthSize(10)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${model.firstname} ${model.lastname}",
              style: TextStyle(
                  fontSize: fontSize(16), fontWeight: FontWeight.w700),
            ),
            SizedBox(height: heightSize(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: heightSize(18),
                  backgroundImage: NetworkImage(
                      regController.parentModel.value.schoolBanner),
                ),
                SizedBox(width: widthSize(5)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    regController.parentModel.value.schoolName,
                    style: TextStyle(
                        fontSize: fontSize(14), fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        Icon(
          Icons.arrow_forward_ios,
          size: heightSize(20),
        )
      ]),
    ),
  );
}
