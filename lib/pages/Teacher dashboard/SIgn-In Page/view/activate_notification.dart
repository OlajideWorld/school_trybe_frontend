import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:local_auth/local_auth.dart";
import "package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/view/signup_success.dart";
import "package:school_management/utils/colors.dart";
import "package:school_management/utils/sizes.dart";

import "../../../../common/alertMessage.dart";
import "../../../../common/button.dart";
import "../../../School Dashboard/SignIn screeen/view/admin_sign_up_success.dart";

class ActivateNotification extends StatefulWidget {
  final String type;
  const ActivateNotification({super.key, required this.type});

  @override
  State<ActivateNotification> createState() => _ActivateNotificationState();
}

class _ActivateNotificationState extends State<ActivateNotification> {
  final LocalAuthentication auth = LocalAuthentication();
  bool? _canCheckbiometrics;
  List<BiometricType>? _availableBiometrics;
  String authorized = "Not Authorised";
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported),
        );
    _checkBiometrics();
    _getAvailableBiometrics();
  }

  Future<void> _checkBiometrics() async {
    bool? canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      log(e.toString());
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _canCheckbiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType>? availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
      print("List of Biometrics: $availableBiometrics");
    } on PlatformException catch (e) {
      log(e.toString());
    }

    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticateBiometrics() async {
    bool authenticate = false;

    try {
      authenticate = await auth.authenticate(
          localizedReason: "Touch the Fingerprint sensor",
          options: const AuthenticationOptions(
              stickyAuth: true, biometricOnly: true));

      print("Authenticated: $authenticate");
    } on PlatformException catch (e) {
      log(e.toString());
    }
    if (!mounted) return;
    setState(() {
      authorized =
          authenticate ? "Authorized Success" : "Failed to Authenticate";
      if (authenticate) {
        if (widget.type == "Teacher") {
          Get.to(() => SignUpSuccess(
                type: widget.type,
              ));
        } else if (widget.type == "Parent") {
          Get.to(() => SignUpSuccess(
                type: widget.type,
              ));
        } else if (widget.type == "schoolAdmin") {
          Get.to(() => AdminSignUpSuccess(
                type: widget.type,
              ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Padding(
        padding: EdgeInsets.only(top: heightSize(109)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: heightSize(138),
            width: 138,
            child: Image.asset("assets/Teacher_Dash/finger2.png"),
          ),
          SizedBox(height: heightSize(42)),
          Text(
            "Activate biometrics",
            style:
                TextStyle(fontSize: fontSize(20), fontWeight: FontWeight.w600),
          ),
          SizedBox(height: heightSize(21)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
            child: Text(
              "Activate fingerprints so you do not need to input password every time you want to login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize(16), fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widthSize(30), vertical: heightSize(61)),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  height: heightSize(99),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppButtons(
                            textColor: whitecolor,
                            fontSize: fontSize(14),
                            backgroundColor: maincolor,
                            text: "Activate now",
                            borderColor: maincolor,
                            height: heightSize(60),
                            onTap: _authenticateBiometrics),
                        GestureDetector(
                          onTap: () {
                            if (widget.type == "Teacher") {
                              Get.to(() => SignUpSuccess(
                                    type: widget.type,
                                  ));
                            } else if (widget.type == "Parent") {
                            } else if (widget.type == "schoolAdmin") {
                              Get.to(() => AdminSignUpSuccess(
                                    type: widget.type,
                                  ));
                            }
                          },
                          child: SizedBox(
                            height: 23,
                            width: widthSize(171),
                            child: Text(
                              "I will do this later",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: fontSize(14),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
