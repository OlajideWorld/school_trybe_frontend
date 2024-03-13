import 'package:flutter/material.dart';
import 'package:school_management/common/custom-text.dart';
import 'package:school_management/utils/sizes.dart';

viewResultDetails(String name, double width, VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: heightSize(92),
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: widthSize(19), vertical: heightSize(23)),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: SizedBox(
        height: heightSize(45),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: widthSize(222),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: heightSize(30),
                    width: widthSize(45),
                    child: Image.asset("assets/School_Dash/pdflogo.png"),
                  ),
                  SizedBox(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CText(
                            text: name,
                            color: Color(0xFF3D4080),
                            size: 16,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                          ),
                          const CText(
                              text: "Class Teacher: Mrs. Biobaku",
                              color: Color(0xFF555555),
                              size: 14,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400)
                        ]),
                  )
                ]),
          ),
          Icon(
            Icons.more_vert,
            size: heightSize(24),
            color: const Color(0xFFD8D8D8),
          )
        ]),
      ),
    ),
  );
}
