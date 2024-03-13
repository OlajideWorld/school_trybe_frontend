import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../utils/colors.dart';
import '../view/viewTransactions.dart';

showTransactionsschoool(BuildContext context) {
  return Container(
    height: heightSize(550),
    width: widthSize(428),
    padding: EdgeInsets.only(
        top: heightSize(24), left: widthSize(30), right: widthSize(30)),
    decoration: BoxDecoration(
        color: whitecolor, border: Border.all(color: const Color(0xFFE8E8E8))),
    child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Recent Transactions",
          style: TextStyle(
              fontSize: fontSize(15),
              fontWeight: FontWeight.w600,
              color: const Color(0xFF555555)),
        ),
        GestureDetector(
          onTap: () => Get.to(() => const ViewTransactionsScreen()),
          child: Text(
            "See all",
            style:
                TextStyle(fontSize: fontSize(15), fontWeight: FontWeight.w600),
          ),
        )
      ]),
      SizedBox(height: heightSize(20)),
      showPersonalTransactions(
          context,
          "assets/School_Dash/normalNnamdi.png",
          "Victor Ugwu",
          "School fees payment",
          "2.30pm, today",
          "5,000",
          false),
      SizedBox(height: heightSize(30)),
      showPersonalTransactions(context, "assets/Parents_Dash/parentimage3.png",
          "Admin", "Withdrawal", "2.30pm, today", "1,000", true),
      SizedBox(height: heightSize(30)),
      showPersonalTransactions(
          context,
          "assets/School_Dash/normalNnamdi.png",
          "Victor Ugwu",
          "School fees payment",
          "2.30pm, today",
          "5,000",
          false),
      SizedBox(height: heightSize(30)),
      showPersonalTransactions(context, "assets/Parents_Dash/parentimage3.png",
          "Admin", "Withdrawal", "2.30pm, today", "1,000", true),
      SizedBox(height: heightSize(30)),
      showPersonalTransactions(
          context,
          "assets/School_Dash/normalNnamdi.png",
          "Victor Ugwu",
          "School fees payment",
          "2.30pm, today",
          "5,000",
          false),
    ]),
  );
}

showPersonalTransactions(BuildContext context, String image, String name,
    String depositType, String time, String amount, bool change) {
  return SizedBox(
    height: heightSize(66),
    width: widthSize(366),
    child: Row(
      children: [
        SizedBox(
          height: heightSize(65),
          width: widthSize(65),
          child: Image.asset(image),
        ),
        SizedBox(width: widthSize(10)),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: fontSize(16),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF555555)),
              ),
              SizedBox(height: heightSize(3)),
              Text(
                depositType,
                style: TextStyle(
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600,
                    color:
                        change == false ? const Color(0xFF555555) : Colors.red),
              ),
              SizedBox(height: heightSize(3)),
              Text(
                time,
                style: TextStyle(
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF555555)),
              ),
            ]),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              change == false ? "+ ₦$amount" : "- ₦$amount",
              style: TextStyle(
                  fontSize: fontSize(16),
                  fontWeight: FontWeight.w600,
                  color: change == false ? maincolor : Colors.red),
            ),
            SizedBox(height: heightSize(6)),
            Container(
              height: heightSize(28),
              width: widthSize(93),
              decoration: BoxDecoration(
                  color: change == false
                      ? const Color.fromRGBO(61, 64, 128, 0.1)
                      : const Color.fromRGBO(235, 87, 87, 0.1),
                  border:
                      Border.all(color: const Color.fromRGBO(61, 64, 128, 0.1)),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  "Successful",
                  style: TextStyle(
                      fontSize: fontSize(12),
                      fontWeight: FontWeight.w600,
                      color: change == false ? maincolor : Colors.red),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
