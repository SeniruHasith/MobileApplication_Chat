import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../values/colors.dart';
import '../../values/images.dart';

class ContactUsWidget extends StatelessWidget {
  final String? data;
  final String? image;
  final String? heading;
  final isLoading;

  ContactUsWidget(
      {required this.data,
      required this.image,
      required this.heading,
      this.isLoading});

  String strdata = "";

  //
  // case "Facebook":
  // return AppImages.facebookSocialLogo;
  // case "Twitter":
  // return AppImages.twitterSocialLogo;
  // case "Skype":
  // return AppImages.skypeSocialLogo;

  bool getImage(String img) {
    if (img == AppImages.facebookSocialLogo ||
        img == AppImages.twitterSocialLogo ||
        img == AppImages.skypeSocialLogo) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image == "" ? AppImages.ctbcErrorImage : image!,
          height: getImage(image ?? "") ? 35 : 45,
          width: 45,
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading ?? "test",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * (kIsWeb ? 0.5 : 0.7),
              child: GestureDetector(
                onTap: () => launchUrl(Uri.parse(data ?? "")),
                child: Text(data ?? "Not Provided",
                    style: TextStyle(
                        fontSize: 12, color: AppColors.black.withOpacity(0.6))),
              ),
            )
          ],
        )
      ],
    );
  }
}
