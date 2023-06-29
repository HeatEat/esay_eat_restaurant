import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

extension ShowSnackBar on BuildContext {
  showsnackbar({required title, Color color = Colors.red}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(title),
      backgroundColor: color,
    ));
  }
}

extension ShowAlertDialog on BuildContext {
  showAlertDialog(context) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: Text(AppLocalizations.of(context).restaurantDetailHeader),
              content:
                  Text(AppLocalizations.of(context).restaurantDetailContent),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                        AppLocalizations.of(context).restuarantDetailAgree)),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: Text(
                        AppLocalizations.of(context).restuarantDetailDecline)),
              ],
            )));
  }
}
