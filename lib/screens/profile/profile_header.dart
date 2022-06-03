import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/screens/profile/bloc/profile_bloc.dart';
import 'package:mrkt_app/screens/profile/bloc/profile_state.dart';
import 'package:mrkt_app/screens/profile/profile_update.dart';
import 'package:mrkt_app/service_locator.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/border_view.dart';
import 'package:mrkt_app/widget/circular_image.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (_) => getIt<ProfileBloc>(),
      child: BorderView(
        backgroundColor: Theme.of(context).colorScheme.commonColor,
        padding: const EdgeInsets.symmetric(
            horizontal: spacing_8, vertical: spacing_16),
        child: Row(
          children: [
            const CircularImage(avatarUrl: ''),
            const SizedBox(
              width: spacing_12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (previous, current) =>
                        previous.user != current.user,
                    builder: (context, state) {
                      return Text(
                        '${state.user?.firstname} ${state.user?.lastname}',
                        style: textTheme.headline2?.copyWith(
                            fontFamily: semiBoldFont,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .colorScheme
                                .profileTitleColor),
                      );
                    }),
                BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (previous, current) =>
                        previous.user != current.user,
                    builder: (context, state) {
                      return Text(
                        'Nickname: ${state.user?.nickname}',
                        style: textTheme.headline4?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .profileTitleColor),
                      );
                    }),
                BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (previous, current) =>
                        previous.user != current.user,
                    builder: (context, state) {
                      return Text('Birthday: ${state.user?.birthday ?? '-'} ',
                          style: textTheme.headline5);
                    }),
              ],
            ),
            const Spacer(),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () =>
                    Navigator.of(context).pushNamed(ProfileUpdate.route),
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: spacing_40, top: spacing_20, bottom: spacing_20),
                    child: SvgPicture.asset(
                      'asset/icons/ic_chevron_next.svg',
                      color: Theme.of(context).iconTheme.color,
                    ))),
          ],
        ),
      ),
    );
  }
}
