import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectPickUpPlace extends StatelessWidget {
  const SelectPickUpPlace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context).pickUpPlace,
            style: const TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
          ),
          Row(
            children: [
              const Text("RZE001"),
              Icon(
                Icons.arrow_drop_down_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
