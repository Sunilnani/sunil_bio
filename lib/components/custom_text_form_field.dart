import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sunil_bio/components/colors.dart';




class AppTextFormField extends StatelessWidget {
  final String ?title;
  final String ?hintText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final IconData? suffixIcon;
  final bool? readOnly;
  final GestureTapCallback? suffixIconOnTap;
  final String? Function(String?)? validator;
  final Color? color;
  final Color? focusColor;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final TextEditingController ?controller;
  final bool ?enabled;
  final TextInputType ?textInputType;
  final bool ?obscureText;
  final Function(dynamic) ?onChanged;
  final List<TextInputFormatter> ?inputFormatters;
  final EdgeInsets? inputDecorationPadding;
  final Decoration? decoration;
  final int? maxLines;
  final Icon? suffix;


  const AppTextFormField({
    Key? key,
    this.focusNode,
    this.textInputAction,
    this.title,
    this.decoration,
    this.hintText,
    this.suffixIcon,
    this.readOnly,
    this.suffixIconOnTap,
    this.validator,
    this.color,
    this.focusColor,
    this.controller,
    this.enabled,
    this.textInputType,
    this.inputFormatters,
    this.borderColor,
    this.fillColor,
    this.obscureText,
    this.onChanged,
    this.textColor,
    this.inputDecorationPadding,
    this.maxLines,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if(title!=null)Text(
          //   title ?? "",
          //   style: TextStyle(
          //       color: color ??  Theme.of(context).primaryColor,
          //       fontWeight: FontWeight.w500,
          //       fontSize: 16),
          // ),
          // if(title!=null) const SizedBox(
          //   height: 20,
          // ),
          Container(
            decoration: BoxDecoration(
              color: CustomColors.cardBgColor,
              borderRadius:  BorderRadius.circular(8),
            ),
            child: TextFormField(
              controller: controller,
              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),
              inputFormatters: inputFormatters ?? [],
              validator: validator,
              keyboardType: textInputType ?? TextInputType.text,
              decoration: InputDecoration(
                suffixIcon: suffix,
                hintStyle: TextStyle(fontSize: 14,color: CustomColors.textDarkColor),
                labelText:title,
                labelStyle: TextStyle(fontSize: 12,color: CustomColors.textLightColor),
                hintText: hintText ?? title,
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(20, 10, 24, 10),
              ),
            ),
          ),
        ],
      ),

    );
  }
}


