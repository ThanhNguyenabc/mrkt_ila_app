import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrkt_app/application_bloc.dart';
import 'package:mrkt_app/application_event.dart';
import 'package:mrkt_app/application_state.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';

import 'package:mrkt_app/widget/border_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  int selectedIndex = 1;

  final languages = [
    {"icon": "asset/images/img_vie.png", "type": Language.vi},
    {"icon": "asset/images/img_eng.png", "type": Language.en}
  ];
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    print("load load");
    final items = languages
        .map((item) => BlocBuilder<ApplicationBloc, ApplicationState>(
            buildWhen: (previous, current) =>
                previous.languageType != current.languageType,
            builder: (context, state) {
              final languageType = item["type"] as Language;
              return LanguageItem(
                iconPath: item['icon'] as String,
                isSelected: languageType == state.languageType,
                onPressItem: () {
                  BlocProvider.of<ApplicationBloc>(context)
                      .add(ChangeLanguage(languageType));
                },
              );
            }))
        .toList();
    return BorderView(
        backgroundColor: Theme.of(context).colorScheme.commonColor,
        padding: const EdgeInsets.all(spacing_10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.language,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: spacing_12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing_30),
              child: Row(
                children: items,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ],
        ));
  }

  onSelectLanguage() {}
}

class LanguageItem extends StatelessWidget {
  final String iconPath;
  final bool isSelected;

  final VoidCallback? onPressItem;

  const LanguageItem(
      {Key? key,
      required this.iconPath,
      required this.isSelected,
      this.onPressItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressItem,
      child: Column(
        children: [
          SizedBox(
            child: Image.asset(iconPath),
            width: 40,
            height: 40,
          ),
          Transform.scale(
            scale: 0.85,
            child: Radio(
              value: isSelected,
              groupValue: true,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
