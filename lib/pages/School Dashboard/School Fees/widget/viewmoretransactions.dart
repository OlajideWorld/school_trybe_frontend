import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/School%20Fees/widget/schoolfeeswidget.dart';
import 'package:school_management/utils/sizes.dart';

import '../view/viewReceipt.dart';

class ShowMoreTransctionsWidget extends StatelessWidget {
  const ShowMoreTransctionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=> const ViewReceiptScreen()),
      child: Container(
        height: heightSize(830),
        width: widthSize(428),
        padding: EdgeInsets.only(
            top: heightSize(24), right: widthSize(30), left: widthSize(30)),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFE8E8E8)),
        ),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Recent Transactions",
              style: TextStyle(
                  fontSize: fontSize(15),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF555555)),
            ),
            Text(
              "See all",
              style: TextStyle(
                  fontSize: fontSize(15), fontWeight: FontWeight.w600),
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
          showPersonalTransactions(
              context,
              "assets/Parents_Dash/parentimage3.png",
              "Admin",
              "Withdrawal",
              "2.30pm, today",
              "1,000",
              true),
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
          showPersonalTransactions(
              context,
              "assets/Parents_Dash/parentimage3.png",
              "Admin",
              "Withdrawal",
              "2.30pm, today",
              "1,000",
              true),
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
          showPersonalTransactions(
              context,
              "assets/Parents_Dash/parentimage3.png",
              "Admin",
              "Withdrawal",
              "2.30pm, today",
              "1,000",
              true),
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
          showPersonalTransactions(
              context,
              "assets/Parents_Dash/parentimage3.png",
              "Admin",
              "Withdrawal",
              "2.30pm, today",
              "1,000",
              true),
          SizedBox(height: heightSize(30)),
        ]),
      ),
    );
  }
}
