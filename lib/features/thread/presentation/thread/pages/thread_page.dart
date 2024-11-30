import 'package:flutter/cupertino.dart';
import 'package:threads/features/thread/presentation/thread/widgets/custom_divider.dart';
import 'package:threads/features/thread/presentation/thread/widgets/thread_item.dart';

class ThreadPage extends StatelessWidget {
  const ThreadPage({
    super.key,
    required this.scrollController,
    required this.handleScrollEnd,
  });

  final ScrollController scrollController;
  final Function handleScrollEnd;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (notification) {
            handleScrollEnd();
            return true;
          },
          child: ListView.separated(
            controller: scrollController,
            itemCount: 100,
            separatorBuilder: (context, index) {
              return const CustomDivider();
            },
            itemBuilder: (context, index) {
              return const ThreadItem();
            },
          ),
        ),
      ),
    );
  }
}
