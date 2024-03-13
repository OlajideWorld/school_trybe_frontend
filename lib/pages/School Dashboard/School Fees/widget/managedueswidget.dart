import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";
import "package:school_management/common/button.dart";
import "package:school_management/utils/colors.dart";
import "package:school_management/utils/sizes.dart";

import "../../../../models/school_dues.dart";
import "../view/selectClassManageDue.dart";
import "../view/vieweEachLibraryStudent.dart";

class ManageDuesScreenWidget extends StatefulWidget {
  final SchoolDues schoolDues;
  const ManageDuesScreenWidget({super.key, required this.schoolDues});

  @override
  State<ManageDuesScreenWidget> createState() => _ManageDuesScreenWidgetState();
}

class _ManageDuesScreenWidgetState extends State<ManageDuesScreenWidget> {
  bool change = false;

  String formatNumberWithCommas(int number) {
    String formattedNumber = NumberFormat.decimalPattern().format(number);
    return formattedNumber;
  }

  @override
  Widget build(BuildContext context) {
    DateTime yourDate = widget.schoolDues.deadline;
    String formattedDate = DateFormat('d MMM y').format(yourDate);

    String money = formatNumberWithCommas(widget.schoolDues.amount);

    return GestureDetector(
      onTap: () {
        setState(() {
          change = !change;
        });
      },
      child: Container(
        height: change == false ? heightSize(90) : heightSize(337),
        width: widthSize(368),
        padding: EdgeInsets.only(
            top: heightSize(18), right: widthSize(20), left: widthSize(20)),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: whitecolor,
            border: Border.all(color: backgroundColor2)),
        child: Column(children: [
          Row(children: [
            SizedBox(
              height: heightSize(55),
              width: widthSize(55),
              child: SvgPicture.asset("assets/School_Dash/managedues.svg"),
            ),
            SizedBox(width: widthSize(10)),
            Text(
              widget.schoolDues.feeDescription,
              style: TextStyle(
                  fontSize: fontSize(16), fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            SizedBox(
                width: widthSize(100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₦$money",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: fontSize(16),
                          fontWeight: FontWeight.w600),
                    ),
                    change == true
                        ? Icon(Icons.arrow_drop_up, size: heightSize(20))
                        : Icon(Icons.arrow_drop_down, size: heightSize(20))
                  ],
                )),
          ]),
          if (change == true) showTheButtons(context, formattedDate)
        ]),
      ),
    );
  }

  showTheButtons(BuildContext context, String date) {
    return SizedBox(
      child: Column(children: [
        SizedBox(height: heightSize(20)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            " Description",
            style:
                TextStyle(fontSize: fontSize(14), fontWeight: FontWeight.w400),
          ),
          Text(
            widget.schoolDues.feeDescription,
            style:
                TextStyle(fontSize: fontSize(14), fontWeight: FontWeight.w600),
          )
        ]),
        SizedBox(height: heightSize(15)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Level",
            style:
                TextStyle(fontSize: fontSize(14), fontWeight: FontWeight.w400),
          ),
          Text(
            widget.schoolDues.classAssigned.first,
            style:
                TextStyle(fontSize: fontSize(14), fontWeight: FontWeight.w600),
          )
        ]),
        SizedBox(height: heightSize(15)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Due Date",
            style:
                TextStyle(fontSize: fontSize(14), fontWeight: FontWeight.w400),
          ),
          Text(
            date,
            style:
                TextStyle(fontSize: fontSize(14), fontWeight: FontWeight.w600),
          ),
        ]),
        SizedBox(height: heightSize(20)),
        AppButtons(
            textColor: whitecolor,
            fontSize: fontSize(14),
            backgroundColor: maincolor,
            text: "View Payments",
            borderColor: maincolor,
            height: heightSize(50),
            onTap: () => Get.to(() => const SelectClassManageDues())),
        SizedBox(height: heightSize(10)),
        AppButtons(
            textColor: whitecolor,
            fontSize: fontSize(14),
            backgroundColor: Colors.red,
            text: "Delete fee",
            borderColor: Colors.red,
            height: heightSize(50),
            onTap: () {}),
      ]),
    );
  }
}

viewTheStudentLibraryFee(BuildContext context) {
  return GestureDetector(
    onTap: () => Get.to(() => const ViewEachLibraryFeesStudent()),
    child: Container(
      height: heightSize(224),
      width: widthSize(165),
      padding: EdgeInsets.symmetric(
          horizontal: widthSize(20), vertical: heightSize(23)),
      decoration: BoxDecoration(
          border: Border.all(color: backgroundColor2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: heightSize(69),
          width: widthSize(69),
          child: Image.asset("assets/School_Dash/michealNelson.png"),
        ),
        SizedBox(height: heightSize(10)),
        SizedBox(
          height: heightSize(42),
          width: widthSize(138),
          child: Text(
            "Michael Nelson Adesanmi",
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: fontSize(14), fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: heightSize(10)),
        Container(
            height: heightSize(41),
            width: widthSize(68),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(33, 150, 83, 0.1),
            ),
            child: Center(
              child: Text(
                "Paid",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600),
              ),
            ))
      ]),
    ),
  );
}

viewTheStudentLibraryFee2(BuildContext context) {
  return GestureDetector(
    onTap: () => Get.to(() => const ViewEachLibraryFeesStudent()),
    child: Container(
      height: heightSize(224),
      width: widthSize(165),
      padding: EdgeInsets.symmetric(
          horizontal: widthSize(20), vertical: heightSize(23)),
      decoration: BoxDecoration(
          border: Border.all(color: backgroundColor2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: heightSize(69),
          width: widthSize(69),
          child: Image.asset("assets/School_Dash/michealNelson.png"),
        ),
        SizedBox(height: heightSize(10)),
        SizedBox(
          height: heightSize(42),
          width: widthSize(138),
          child: Text(
            "Michael Nelson Adesanmi",
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: fontSize(14), fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: heightSize(10)),
        Container(
            height: heightSize(41),
            width: widthSize(68),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(235, 87, 87, 0.1),
            ),
            child: Center(
              child: Text(
                "Pending",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600),
              ),
            ))
      ]),
    ),
  );
}
