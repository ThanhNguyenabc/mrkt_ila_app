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
      'selectedIcon': 'asset/icons/ic_light_mode.svg',
      'unSelectedIcon': 'asset/icons/ic_unselect_lightmode.svg',
      'mode': ThemeMode.light
    },
    {
      'title': 'Dark mode',
      'selectedIcon': 'asset/icons/ic_dark_mode.svg',
      'unSelectedIcon': 'asset/icons/ic_unselect_darkmode.svg',
      "size": 19.0,
      'mode': ThemeMode.dark
    }
  ];
  @override
  Widget build(BuildContext context) {
    final modes = appearanceMode
        .map((item) => BlocBuilder<ApplicationBloc, ApplicationState>(
            buildWhen: (previous, current) =>
                previous.appearanceMode != current.appearanceMode,
            builder: (context, state) {
              final itemMode = item['mode'] as ThemeMode;
              return ModeItem(
                  selectedIcon: item['selectedIcon'] as String,
                  unSelectedIcon: item['unSelectedIcon'] as String,
                  iconSize: item["size"] as double?,
                  isSelected: itemMode == state.appearanceMode,
                  onPressItem: () {
                    BlocProvider.of<ApplicationBloc>(context)
                        .add(ChangeAppearanceMode(itemMode));
                  },
                  title: item['title'] as String);
            }))
        .toList();
    return BorderView(
      backgroundColor: Theme.of(context).colorScheme.commonColor,
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
  final String selectedIcon;
  final String unSelectedIcon;

  final bool isSelected;
  final String title;
  final VoidCallback? onPressItem;
  final double? iconSize;
  const ModeItem(
      {Key? key,
      required this.selectedIcon,
      required this.unSelectedIcon,
      required this.isSelected,
      required this.title,
      this.iconSize,
      this.onPressItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor = isSelected
        ? Theme.of(context).colorScheme.selectedAppearanceColor
        : AppColors.alto;
    final icon = isSelected ? selectedIcon : unSelectedIcon;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressItem,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            width: iconSize,
            height: iconSize,
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
