import 'package:flutter/material.dart';

import '../../../../core/themes/themes.dart';

class MTGCard extends StatelessWidget {
  const MTGCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingLarge),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("WXXX"),
                      Text("Name Card"),
                      Text("Type"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => null,
                  child: const Icon(Icons.navigate_next_rounded),
                ),
              ],
            ),
            const Divider(),
            const Center(child: Text("rarity")),
          ],
        ),
      ),
    );
  }
}