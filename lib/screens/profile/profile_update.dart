import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mrkt_app/screens/profile/bloc/profile_bloc.dart';
import 'package:mrkt_app/screens/profile/bloc/profile_state.dart';
import 'package:mrkt_app/service_locator.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/bottom_action_sheet.dart';
import 'package:mrkt_app/widget/button.dart';
import 'package:mrkt_app/widget/circular_image.dart';
import 'package:mrkt_app/widget/index.dart';
import 'package:mrkt_app/widget/input_text.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);
  static const route = '/profile_update';
  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  final String dateFormat = "dd/MM/yyyy";
  TextEditingController txtFirstNameController = TextEditingController();
  TextEditingController txtNickNameController = TextEditingController();
  TextEditingController txtCalendarController = TextEditingController();
  TextEditingController txtLastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtCalendarController.text = DateFormat(dateFormat).format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(spacing_16),
        child: BlocProvider(
          create: (_) => getIt<ProfileBloc>(),
          child: BlocConsumer<ProfileBloc, ProfileState>(
              builder: (context, state) {
                txtFirstNameController.text = state.user?.firstname ?? '';
                txtLastNameController.text = state.user?.lastname ?? '';
                txtNickNameController.text = state.user?.nickname ?? '';

                return Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            top: spacing_20, bottom: spacing_40),
                        child: CircularImage(
                            onPressEdit: uploadOrTakePicture,
                            isShowEditView: true,
                            avatarUrl:
                                'https://media.baamboozle.com/uploads/images/551156/1636687300_25508.jpeg')),
                    Padding(
                      padding: const EdgeInsets.only(bottom: spacing_20),
                      child: InputText(
                        controller: txtFirstNameController,
                        hint: 'Input your first name',
                        borderRadius: radius_10,
                      ),
                    ),
                    InputText(
                      controller: txtLastNameController,
                      hint: 'Input last name',
                      borderRadius: radius_10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: spacing_20),
                      child: InputText(
                        controller: txtNickNameController,
                        hint: 'Input your nickname',
                        borderRadius: radius_10,
                      ),
                    ),
                    InputText(
                      controller: txtCalendarController,
                      backgroundColor: AppColors.seashell,
                      borderRadius: radius_10,
                      rightIcon:
                          SvgPicture.asset('asset/icons/ic_calendar.svg'),
                      onPressRightIcon: () =>
                          showCalendarPicker(context, (date) {
                        txtCalendarController.text =
                            DateFormat("dd/MM/yyyy").format(date);
                      }),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Button(
                      title: 'Update Profile',
                      onPress: () {},
                    )
                  ],
                );
              },
              listener: (ocntext, state) {}),
        ),
      ),
    );
  }

  void uploadOrTakePicture() {
    showBottomAction(context, [
      ActionSheetItem(
        onPress: () {},
        title: 'Take a photo',
        iconName: 'asset/icons/ic_camera.svg',
      ),
      ActionSheetItem(
        onPress: () {},
        title: 'Upload a photo',
        iconName: 'asset/icons/ic_upload_photo.svg',
      )
    ]);
  }
}
