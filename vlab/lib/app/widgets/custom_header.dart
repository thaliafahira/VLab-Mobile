import 'package:flutter/material.dart';
import 'package:vlab_mobile/app/constant/color.dart';
import 'package:vlab_mobile/app/constant/font.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.25,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            VlabColors.birutua,
            VlabColors.birumuda,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'V-',
              style: boldText36.copyWith(color: Colors.white),
            ),
            TextSpan(
              text: 'Lab Fisika',
              style: boldText36.copyWith(color: VlabColors.kuning),
            ),
          ],
        ),
      ),
    );
  }
}
