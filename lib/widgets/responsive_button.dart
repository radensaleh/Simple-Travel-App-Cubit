import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;

  const ResponsiveButton({
    super.key,
    this.isResponsive = false,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive
                ? Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: const AppText(
                        text: 'Book Trip Now', color: Colors.white))
                : Container(),
            Container(
                margin: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Image.asset("img/button-one.png")),
          ],
        ),
      ),
    );
  }
}
