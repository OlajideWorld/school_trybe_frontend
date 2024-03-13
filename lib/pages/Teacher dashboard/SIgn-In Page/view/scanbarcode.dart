import "dart:io";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:qr_code_scanner/qr_code_scanner.dart";
import "package:school_management/common/alertMessage.dart";
import "package:school_management/common/getxmessage.dart";
import "package:school_management/pages/Teacher%20dashboard/Assignment%20Page/widget/selectclassWidget.dart";
import "package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart";
import "package:school_management/routes/routes.dart";
import "package:school_management/services/api_calls.dart";

import "package:school_management/utils/colors.dart";

import "../../../../utils/sizes.dart";

class ScanBarCode extends StatefulWidget {
  final int number;
  final String type;
  const ScanBarCode({super.key, required this.number, required this.type});

  @override
  State<ScanBarCode> createState() => _ScanBarCodeState();
}

class _ScanBarCodeState extends State<ScanBarCode> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  RxBool isloading = false.obs;
  Barcode? result;
  QRViewController? _controller;
  double scanArea = 140;

  RegistrationController regController = RegistrationController.instance;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller!.pauseCamera();
    }
    _controller!.resumeCamera();
  }

  popAuth(String? result) async {
    regController.teacherAdminId.value = result!;
    debugPrint(regController.teacherAdminId.value);
    showAuthLoading("Checking your Qrcode");

    regController.schoolModel.value =
        await ApiCalls().getSchoolDetails(controller.teacherAdminId.value);
    if (regController.schoolModel.value != null) {
      showSuccess();
      await Future.delayed(const Duration(seconds: 1), () {});
      Get.offAndToNamed(TeacherRoutes.registerScreen1);
      // if (regController.type.value == 3) {
      //   Get.to(() => const ParentsChildValidationPage());
      // } else if (controller.type.value == 2) {}
    } else {
      Get.offAllNamed(TeacherRoutes.authScreen);
      _controller?.resumeCamera();
    }
  }

  showSuccess() {
    return showAlertMessageTeacher(
        context,
        false,
        heightSize(219),
        widthSize(253),
        "assets/Teacher_Dash/goodtick.png",
        heightSize(113),
        SizedBox(
          height: heightSize(82),
          width: widthSize(253),
          child: Text(
            'Authentication Successful',
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: fontSize(30), fontWeight: FontWeight.w700),
          ),
        ));
  }

  showAuthLoading(String? text) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: SizedBox(
              height: heightSize(34),
              width: widthSize(159),
              child: Row(children: [
                SizedBox(
                  height: heightSize(34),
                  width: widthSize(34),
                  child: const CircularProgressIndicator(
                    color: maincolor,
                  ),
                ),
                SizedBox(width: widthSize(10)),
                Text(
                  text!,
                  style: TextStyle(
                      fontSize: fontSize(20), fontWeight: FontWeight.w600),
                )
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SizedBox(
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  EdgeInsets.only(top: heightSize(65), left: widthSize(33)),
              child: SizedBox(
                height: heightSize(37.5),
                width: widthSize(223.5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SizedBox(
                            height: heightSize(37.5),
                            width: widthSize(37.5),
                            child: Image.asset(
                                "assets/Teacher_Dash/backarrow2.png")),
                      ),
                      Text("Scan QR code",
                          style: TextStyle(
                              color: textColor2,
                              fontSize: fontSize(20),
                              fontWeight: FontWeight.w600))
                    ]),
              ),
            ),
          ),
          SizedBox(height: heightSize(28.5)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
            child: Container(
              height: heightSize(115),
              padding: EdgeInsets.only(
                  top: heightSize(22),
                  left: widthSize(11),
                  right: widthSize(12),
                  bottom: heightSize(21)),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  border: Border.all(color: maincolor),
                  borderRadius: BorderRadius.circular(widthSize(5))),
              child: Center(
                  child: Text(
                "To confirm your identity as a ${widget.type} of a school, please scan the QR code on the phone of your school administrator",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: maincolor,
                    fontSize: fontSize(16),
                    fontWeight: FontWeight.w400),
              )),
            ),
          ),
          SizedBox(height: heightSize(29)),
          isloading.value == false
              ? Expanded(child: _buidQrscanningScreen(context))
              : Center(
                  child: SizedBox(
                      height: heightSize(60),
                      width: widthSize(60),
                      child: const CircularProgressIndicator(
                        color: maincolor,
                      )),
                )
        ]),
      ),
    );
  }

  Widget _buidQrscanningScreen(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      onPermissionSet: (ctrl, p) => _onpermission(context, ctrl, p),
      overlay: QrScannerOverlayShape(
          cutOutSize: scanArea,
          borderWidth: widthSize(9),
          borderLength: heightSize(33),
          borderColor: whitecolor),
    );
  }

  void _onpermission(
      BuildContext context, QRViewController ctrl, bool permission) {
    if (!permission) {
      Get.back();
      getErrorSnackBar("No Permission!");
    }
  }

  void _onQRViewCreated(QRViewController qrcontroller) {
    setState(() {
      this._controller = qrcontroller;
    });

    _controller?.scannedDataStream.listen((scanData) {
      setState(() {
        print(scanData.toString());
        result = scanData;
      });
      if (result?.code != null) {
        _controller?.pauseCamera();

        debugPrint(result!.code);
        popAuth(result!.code);
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
