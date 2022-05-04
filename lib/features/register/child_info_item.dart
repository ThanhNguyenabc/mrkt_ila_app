import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mrkt_app/models/user.model.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/utils/debounce.dart';
import 'package:mrkt_app/widget/cefr_level_dialog.dart';
import 'package:mrkt_app/widget/index.dart';
import 'package:mrkt_app/widget/input_text.dart';

class ChildInfoItem extends StatefulWidget {
  const ChildInfoItem({
    Key? key,
    this.onUserInfoChanged,
  }) : super(key: key);

  final Function(User)? onUserInfoChanged;

  @override
  State<ChildInfoItem> createState() => _ChildInfoItemState();
}

class _ChildInfoItemState extends State<ChildInfoItem> {
  late Map<String, dynamic> selectedCEFR;
  TextEditingController txtDOBController = TextEditingController();
  User userInfo = User();
  Debounce debounce = Debounce(miliseconds: 300);

  @override
  void initState() {
    selectedCEFR = CEFRLevels[0]!;
    userInfo.cefrlevel = CEFRLevels[0]!['level'];
    super.initState();
  }

  @override
  void dispose() {
    txtDOBController.dispose();
    debounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputTextStyle =
        Theme.of(context).textTheme.headline4?.copyWith(color: AppColors.gigas);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: spacing_40, bottom: spacing_30),
          child: Row(
            children: [
              Flexible(
                child: InputText(
                  onChanged: (txt) {
                    userInfo.firstname = txt;
                    updateUserInfo();
                  },
                  leftIcon: SvgPicture.asset('asset/icons/ic_edit_text.svg'),
                  textStyle: inputTextStyle,
                  hint: 'First name',
                ),
              ),
              const SizedBox(
                width: spacing_14,
              ),
              Flexible(
                child: InputText(
                  leftIcon: SvgPicture.asset('asset/icons/ic_edit_text.svg'),
                  textStyle: inputTextStyle,
                  onChanged: (txt) {
                    userInfo.lastname = txt;
                    updateUserInfo();
                  },
                  hint: 'Last name',
                ),
              ),
            ],
          ),
        ),
        InputText(
          leftIcon: SvgPicture.asset('asset/icons/ic_nickname.svg'),
          textStyle: inputTextStyle,
          onChanged: (txt) {
            userInfo.nickname = txt;
            updateUserInfo();
          },
          hint: 'Nick name',
        ),
        Padding(
          padding: const EdgeInsets.only(top: spacing_30, bottom: spacing_40),
          child: InputText(
            leftIcon: SvgPicture.asset('asset/icons/ic_dob.svg'),
            textStyle: inputTextStyle,
            controller: txtDOBController,
            hint: 'Day of Birth',
            rightIcon: SvgPicture.asset('asset/icons/ic_calendar.svg'),
            onPressRightIcon: () {
              showCalendarPicker(context, (date) {
                txtDOBController.text = DateFormat('dd/MM/yyyy').format(date);
                userInfo.birthday = txtDOBController.text;
                updateUserInfo();
              });
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'CEFR Level',
                style: Theme.of(context).textTheme.headline3?.copyWith(
                    fontFamily: semiBoldFont, color: AppColors.smalt),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CEFRLevelDialog(
                        onSelectedLevel: (index) {
                          userInfo.cefrlevel = CEFRLevels[index]!['level'];

                          updateUserInfo();
                          setState(() {
                            selectedCEFR = CEFRLevels[index]!;
                          });
                        },
                      );
                    });
              },
              child: LevelItem(
                levelName: selectedCEFR['level'],
                backgroundColor: selectedCEFR['color'],
                width: 40,
                textSize: 15,
                isShowSubTitle: false,
              ),
            )
          ],
        )
      ],
    );
  }

  updateUserInfo() {
    debounce.run(() => widget.onUserInfoChanged?.call(userInfo));
  }
}
