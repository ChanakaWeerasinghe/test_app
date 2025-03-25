import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/constants/app_colors.dart';

class PinDialogWidget extends StatelessWidget {
  final Function(String) onEnter;
  final Function() onClose;

  const PinDialogWidget({
    super.key,
    required this.onClose,
    required this.onEnter,
  });

  @override
  Widget build(BuildContext context) {
    var pinCode = "";
    return Material(
      child: Container(
        color: Colors.white,
        width: 255.w,
        height: 160.h,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(height: 18.h),
                    Text(
                      AppLocalizations.of(context)!.msgVerify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppLocalizations.of(context)!.msgEnterPin,
                      style: TextStyle(color: Colors.black, fontSize: 12.3.sp),
                    ),
                    SizedBox(height: 10.h),
                    PinTextField(
                      onTextChanged: (data) {
                        pinCode = data;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 0.8.h,
              width: double.infinity,
              color: Colors.black26,
            ),
            Row(
              children: [
                Expanded(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        onEnter(pinCode);
                      },
                      child: Container(
                        height: 40.h,
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context)!.enter,
                          style: TextStyle(
                            color: AppColors.textGreen,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(width: 0.8.h, height: 40.h, color: Colors.black26),
                Expanded(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: onClose,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40.h,
                        child: Text(
                          AppLocalizations.of(context)!.close,
                          style: TextStyle(
                            color: AppColors.textRed,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PinTextField extends StatefulWidget {
  final Function(String) onTextChanged;

  const PinTextField({super.key, required this.onTextChanged});

  @override
  State<PinTextField> createState() => _PinTextFieldState();
}

class _PinTextFieldState extends State<PinTextField> {
  final FocusNode _textFieldFocusNode = FocusNode();
  String label1 = "-";
  String label2 = "-";
  String label3 = "-";
  String label4 = "-";
  String label5 = "-";
  String label6 = "-";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_textFieldFocusNode);
    });
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  void filterEnteredText(String val) {
    widget.onTextChanged(val);
    switch (val.length) {
      case 0:
        setState(() {
          label1 = "-";
          label2 = "-";
          label3 = "-";
          label4 = "-";
          label5 = "-";
          label6 = "-";
        });
        break;
      case 1:
        setState(() {
          label1 = val[0].toString();
          label2 = "-";
          label3 = "-";
          label4 = "-";
          label5 = "-";
          label6 = "-";
        });
        break;
      case 2:
        setState(() {
          label1 = val[0].toString();
          label2 = val[1].toString();
          label3 = "-";
          label4 = "-";
          label5 = "-";
          label6 = "-";
        });
        break;
      case 3:
        setState(() {
          label1 = val[0].toString();
          label2 = val[1].toString();
          label3 = val[2].toString();
          label4 = "-";
          label5 = "-";
          label6 = "-";
        });
        break;
      case 4:
        setState(() {
          label1 = val[0].toString();
          label2 = val[1].toString();
          label3 = val[2].toString();
          label4 = val[3].toString();
          label5 = "-";
          label6 = "-";
        });
        break;
      case 5:
        setState(() {
          label1 = val[0].toString();
          label2 = val[1].toString();
          label3 = val[2].toString();
          label4 = val[3].toString();
          label5 = val[4].toString();
          label6 = "-";
        });
        break;
      case 6:
        setState(() {
          label1 = val[0].toString();
          label2 = val[1].toString();
          label3 = val[2].toString();
          label4 = val[3].toString();
          label5 = val[4].toString();
          label6 = val[5].toString();
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_textFieldFocusNode);
      },
      child: Stack(
        children: [
          Opacity(
            opacity: 0,
            child: SizedBox(
              width: double.infinity,
              height: 35.h,
              child: TextField(
                maxLength: 6,
                maxLines: 1,
                focusNode: _textFieldFocusNode,
                keyboardType: TextInputType.number,
                onChanged: filterEnteredText,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TextWidget(value: label1),
              SizedBox(width: 15.w),
              _TextWidget(value: label2),
              SizedBox(width: 15.w),
              _TextWidget(value: label3),
              SizedBox(width: 15.w),
              _TextWidget(value: label4),
              SizedBox(width: 15.w),
              _TextWidget(value: label5),
              SizedBox(width: 15.w),
              _TextWidget(value: label6),
            ],
          ),
        ],
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String value;

  const _TextWidget({required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
