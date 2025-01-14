import 'package:flutter/material.dart';
import 'package:vlab_mobile/app/constant/color.dart';
import 'package:vlab_mobile/app/constant/font.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final TextStyle? labelStyle;
  final bool isEnabled;
  final String? hintText;
  final int? maxLines;
  final int? maxLength;
  final void Function()? onTap;
  final TextInputType textInputType;
  final bool isPassword;
  final bool isPasswordHide;
  final TextEditingController controller;
  final void Function()? onPressedIconPassword;
  final bool isAutoValidate;
  final TextInputAction? inputAction;
  final String? Function(String?)? validator;
  final VoidCallback? onCompleted;
  final bool isPasswordEmpty;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    this.labelStyle,
    this.isEnabled = true,
    this.hintText,
    this.maxLines = 1,
    this.maxLength,
    this.onTap,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.isPasswordHide = false,
    this.isRequired = true,
    required this.controller,
    this.onPressedIconPassword,
    this.isAutoValidate = true,
    this.inputAction,
    this.validator,
    this.onCompleted,
    this.suffixIcon,
    this.isPasswordEmpty = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Visibility(
          visible: label != '',
          child: Text(
            label,
            style: labelStyle ??
                theme.textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
        Visibility(
          visible: label != '',
          child: const SizedBox(height: 10),
        ),
        TextFormField(
          autofocus: false,
          autocorrect: false,
          validator: validator,
          enabled: isEnabled,
          obscureText: isPasswordHide,
          controller: controller,
          style: mediumText16,
          keyboardType: textInputType,
          maxLines: maxLines,
          maxLength: maxLength,
          cursorColor: VlabColors.birutua,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.labelMedium!.copyWith(
              color: VlabColors.neutralColors[2],
              fontSize: 16,
            ),
            focusedBorder: onTap != null
                ? _buildCustomBorder(
                    color: VlabColors.neutralColors[3],
                  )
                : _buildCustomBorder(color: VlabColors.birutua),
            enabledBorder: _buildCustomBorder(
              color: VlabColors.neutralColors[3],
            ),
            border: _buildCustomBorder(
              color: VlabColors.neutralColors[3],
            ),
            errorBorder: _buildCustomBorder(
              color: Colors.red,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordHide ? Icons.visibility : Icons.visibility_off,
                    ),
                    color: Colors.black,
                    onPressed: onPressedIconPassword,
                  )
                : suffixIcon,
          ),
          onEditingComplete: onCompleted,
          readOnly: onTap != null,
          onTap: onTap,
          textInputAction: inputAction,
          autovalidateMode:
              isAutoValidate ? AutovalidateMode.onUserInteraction : null,
          onTapOutside: (event) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ),
      ],
    );
  }

  OutlineInputBorder _buildCustomBorder({
    required Color color,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
