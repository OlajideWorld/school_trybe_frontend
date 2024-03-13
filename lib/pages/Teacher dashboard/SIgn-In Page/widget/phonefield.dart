import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class PhoneFieldInput extends StatefulWidget {
  const PhoneFieldInput({super.key});

  @override
  State<PhoneFieldInput> createState() => _PhoneFieldInputState();
}

class _PhoneFieldInputState extends State<PhoneFieldInput> {
  final RegistrationController _controller = RegistrationController.instance;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(94),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Phone Number",
                style: TextStyle(
                    fontSize: fontSize(14), fontWeight: FontWeight.w600)),
            Container(
              height: heightSize(65),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: colors1),
                  borderRadius: BorderRadius.circular(widthSize(5))),
              child: IntlPhoneField(
                showDropdownIcon: true,
                flagsButtonPadding: EdgeInsets.only(left: widthSize(10)),
                dropdownIconPosition: IconPosition.trailing,
                disableLengthCheck: true,
                decoration: const InputDecoration(
                  hintText: "Phone Number",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: maincolor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: pageindicator),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  _controller.phoneNumber.value = phone.completeNumber;
                  debugPrint(phone.number);
                },
              ),
            )
          ]),
    );
  }
}
