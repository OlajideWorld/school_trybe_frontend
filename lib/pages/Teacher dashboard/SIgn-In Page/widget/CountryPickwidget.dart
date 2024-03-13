import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class CountryPickerWidget extends StatefulWidget {
  const CountryPickerWidget({super.key});

  @override
  State<CountryPickerWidget> createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
          exclude: <String>['KN', 'MF'],
          favorite: <String>['SE'],
          //Optional. Shows phone code before the country name.
          showPhoneCode: true,
          onSelect: (Country country) {
            controller.country.value = country.name;

            print('Select country: ${country.name}');
          },
          // Optional. Sets the theme for the country list picker.
          countryListTheme: CountryListThemeData(
            // Optional. Sets the border radius for the bottomsheet.
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            // Optional. Styles the search field.
            inputDecoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Start typing to search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                ),
              ),
            ),
            // Optional. Styles the text in the search field
            searchTextStyle: const TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        );
      },
      child: SizedBox(
        height: heightSize(94),
        child: Obx(() {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Nationality",
                    style: TextStyle(
                        fontSize: fontSize(14), fontWeight: FontWeight.w600)),
                Container(
                  height: heightSize(65),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      left: widthSize(20), right: widthSize(30)),
                  decoration: BoxDecoration(
                      border: Border.all(color: colors1),
                      borderRadius: BorderRadius.circular(widthSize(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.country.value,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: fontSize(16)),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: heightSize(20),
                        color: maincolor,
                      )
                    ],
                  ),
                )
              ]);
        }),
      ),
    );
  }
}
