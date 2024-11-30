import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:threads/core/config/app_icons.dart';
import 'package:threads/features/thread/presentation/thread/pages/thread_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _threadController;
  int _currentIndex = 0;
  double _currentTabBarHeight = kBottomNavigationBarHeight;
  double _lastOffset = 0;

  void _onItemTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _handleScroll() {
    if (_threadController.position.outOfRange) return;

    final offset = _threadController.offset;
    final direction = _threadController.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      // Cuộn xuống: Giảm chiều cao tab bar
      setState(() {
        _currentTabBarHeight = (_currentTabBarHeight - (offset - _lastOffset))
            .clamp(0, kBottomNavigationBarHeight);
      });
    } else if (direction == ScrollDirection.forward) {
      // Cuộn lên: Tăng chiều cao tab bar
      setState(() {
        _currentTabBarHeight = (_currentTabBarHeight + (_lastOffset - offset))
            .clamp(0, kBottomNavigationBarHeight);
      });
    }

    _lastOffset = offset;
  }

  void _handleScrollEnd() {
    if (_currentTabBarHeight == 0 ||
        _currentTabBarHeight == kBottomNavigationBarHeight) return;

    // Khi ngừng cuộn, đặt chiều cao về 0 hoặc 56 tùy thuộc vào giá trị hiện tại
    if (_currentTabBarHeight < kBottomNavigationBarHeight / 3) {
      setState(() {
        _currentTabBarHeight = 0;
      });
    } else {
      setState(() {
        _currentTabBarHeight = kBottomNavigationBarHeight;
      });
    }
  }

  @override
  void initState() {
    _threadController = ScrollController();
    _threadController.addListener(_handleScroll);
    super.initState();
  }

  @override
  void dispose() {
    _threadController.removeListener(_handleScroll);
    _threadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
        height: _currentTabBarHeight,
        duration: const Duration(milliseconds: 100),
        child: Wrap(
          children: [
            CupertinoTabBar(
              currentIndex: _currentIndex,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    onLongPress: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return const CupertinoPageScaffold(
                            child: Center(
                              child: Text("data"),
                            ),
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: SvgPicture.asset(
                        AppIcons.icHome,
                      ),
                    ),
                  ),
                  activeIcon: GestureDetector(
                    onTap: () {
                      if (_threadController.offset > 0) {
                        _threadController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      } else {
                        if (_threadController.offset < 0) return;
                        _threadController.animateTo(
                          -100,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    onLongPress: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Scaffold(
                            appBar: CupertinoNavigationBar(
                              middle: const Text("Thread mới"),
                              trailing: const Icon(
                                CupertinoIcons.ellipsis_circle,
                                size: 24,
                              ),
                              leading: CupertinoButton(
                                onPressed: Navigator.of(context).pop,
                                padding: EdgeInsets.zero,
                                child: const Text("Hủy"),
                              ),
                            ),
                            body: const Center(
                              child: Text("Thread mới"),
                            ),
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: SvgPicture.asset(
                        AppIcons.icHomeActive,
                      ),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.icHome),
                  activeIcon: SvgPicture.asset(AppIcons.icHomeActive),
                ),
              ],
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ThreadPage(
            scrollController: _threadController,
            handleScrollEnd: _handleScrollEnd,
          ),
          Center(
            child: Text(DateTime.now().toString()),
          ),
        ],
      ),
    );
  }
}
