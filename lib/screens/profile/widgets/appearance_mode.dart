import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/application_bloc.dart';
import 'package:mrkt_app/application_event.dart';
import 'package:mrkt_app/application_state.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/border_view.dart';

class AppearanceMode extends StatelessWidget {
  const AppearanceMode({Key? key}) : super(key: key);

  final appearanceMode = const [
    {
      'title': 'Light mode',
      'icon': 'asset/icons/ic_light_mode.svg',
      'mode': Appearance.light
    },
    {
      'title': 'Dark mode',
      'icon': 'asset/icons/ic_dark_mode.svg',
      'mode': Appearance.dark
    }
  ];
  @override
  Widget build(BuildContext context) {
    final modes = appearanceMode
        .map((item) => BlocBuilder<ApplicationBloc, ApplicationState>(
            buildWhen: (previous, current) =>
                previous.appearanceMode != current.appearanceMode,
            builder: (context, state) {
              final itemMode = item['mode'] as Appearance;
              return ModeItem(
                  iconPath: item['icon'] as String,
                  isSelected: itemMode == state.appearanceMode,
                  onPressItem: () {
                    BlocProvider.of<ApplicationBloc>(context)
                        .add(ChangeAppearanceMode(itemMode));
                  },
                  title: item['title'] as String);
            }))
        .toList();
    return BorderView(
      padding: const EdgeInsets.symmetric(
          horizontal: spacing_10, vertical: spacing_20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Appearance",
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          ...modes
        ],
      ),
    );
  }
}

class ModeItem extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  final String title;
  final VoidCallback? onPressItem;

  const ModeItem(
      {Key? key,
      required this.iconPath,
      required this.isSelected,
      required this.title,
      this.onPressItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor = isSelected ? Colors.black : AppColors.alto;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressItem,
      child: Column(
        children: [
          SvgPicture.asset(
            iconPath,
            color: selectedColor,
          ),
          const SizedBox(
            height: spacing_8,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.w300, color: selectedColor),
          ),
        ],
      ),
    );
  }
}
