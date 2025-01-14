import 'package:flutter/material.dart';
import 'package:vlab_mobile/app/constant/color.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final Function() onTap;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color: VlabColors.birumuda,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
            color: VlabColors.birumuda),
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
