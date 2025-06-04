import 'package:flutter/material.dart';

class AnimatedListBuilder extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  AnimatedListBuilder({required this.itemCount, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: itemBuilder(context, index),
        );
      },
    );
  }
}