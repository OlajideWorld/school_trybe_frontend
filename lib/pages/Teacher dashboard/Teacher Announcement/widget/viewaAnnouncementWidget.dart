import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../view/annnouncement_options.dart';

class ViewAllAnnouncementWidget extends StatelessWidget {
  final String title;
  final String description;
  const ViewAllAnnouncementWidget(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(232),
      width: widthSize(368),
      padding: EdgeInsets.only(
          top: heightSize(23),
          left: widthSize(19),
          right: widthSize(5),
          bottom: heightSize(24)),
      decoration: BoxDecoration(
        color: whitecolor,
        border: Border.all(color: colors1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            SizedBox(
              width: widthSize(286),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: fontSize(20),
                  color: maincolor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // SizedBox(width: widthSize(10)),
            PopupMenuButton(
                color: Colors.white,
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                onSelected: (value) {
                  if (value == 1) {
                    Get.to(() => const AnnouncementOptions());
                  }
                  if (value == 2) {}
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                          value: 1,
                          child: Text(
                            "Delete this Event",
                            style: TextStyle(
                                fontSize: fontSize(16),
                                fontWeight: FontWeight.w600),
                          )),
                      PopupMenuItem(
                          value: 2,
                          child: Text(
                            "Edit this Event",
                            style: TextStyle(
                                fontSize: fontSize(16),
                                fontWeight: FontWeight.w600),
                          )),
                    ])
          ],
        ),
        SizedBox(height: heightSize(10)),
        SizedBox(
          width: widthSize(300),
          child: Text(
            description,
            style: TextStyle(
              fontSize: fontSize(18),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: widthSize(336),
          child: Row(
            children: [
              Text(
                "2 minutes ago",
                style: TextStyle(
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                "Read More",
                style: TextStyle(
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600,
                    color: textColor3),
              ),
              SizedBox(width: widthSize(7)),
              Icon(
                Icons.arrow_forward_ios,
                color: textColor3,
                size: heightSize(15),
              )
            ],
          ),
        )
      ]),
    );
  }
}
