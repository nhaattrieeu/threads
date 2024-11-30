import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:threads/core/config/config.dart';

class ThreadItem extends StatelessWidget {
  const ThreadItem({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "nhaattrieeu";
    String time = "3 giờ";
    int like = 0;
    bool liked = false;
    String content =
        '''Sam Altman vừa thực hiện một vụ đánh cắp lớn nhất trong lịch sử doanh nghiệp:
Anh ấy đang công khai “cuỗm” những kỹ sư hàng đầu của Google và trả cho họ 10 triệu đô la mỗi năm.
Tuy nhiên, tiền không phải là lý do hàng đầu khiên họ chuyển sang làm việc cho OpenAi.''';
    String path =
        "https://raw.githubusercontent.com/nhaattrieeu/temp_storage/refs/heads/main/432700301_935128371414362_7593378051883446897_n.jpg";

    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 16, right: 12, bottom: 12),
      child: Column(
        children: [
          Visibility(
            visible: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.icStar,
                    width: 16,
                    height: 16,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  const Gap(8),
                  Text(
                    "Thread đầu tiên",
                    style: AppTheme.firstThreadTextStyle(context),
                  ),
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  color: Theme.of(context).hintColor,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: path,
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              name,
                              style: AppTheme.usernameTextStyle(context),
                            ),
                            const Gap(6),
                            Text(
                              time,
                              style: AppTheme.timeTextStyle(context),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          AppIcons.ic3dotsHorizontal,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ],
                    ),
                    Text(
                      content,
                      style: AppTheme.contentTextStyle(context),
                    ),
                    const Gap(10),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return CupertinoButton(
                          onPressed: () {
                            liked = !liked;
                            if (liked) {
                              setState(() {
                                like = ++like;
                              });
                            } else {
                              setState(() {
                                like = --like;
                              });
                            }
                          },
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          pressedOpacity: 1,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                liked ? AppIcons.icLikeActive : AppIcons.icLike,
                              ),
                              const Gap(4),
                              AnimatedSize(
                                duration: const Duration(milliseconds: 200),
                                child: Visibility(
                                  visible: like == 0 ? false : true,
                                  child: Row(
                                    children: [
                                      const Gap(4),
                                      AnimatedFlipCounter(
                                        value: like,
                                        textStyle: AppTheme.toolBarTextStyle(
                                          context,
                                          liked
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .error
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .secondaryFixed,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Gap(24),
                              CupertinoButton(
                                onPressed: () {},
                                minSize: 0,
                                padding: EdgeInsets.zero,
                                pressedOpacity: 1,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.icComment),
                                    const Gap(4),
                                    AnimatedSize(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: Visibility(
                                        visible: like == 0 ? false : true,
                                        child: Row(
                                          children: [
                                            const Gap(4),
                                            AnimatedFlipCounter(
                                              value: like,
                                              textStyle:
                                                  AppTheme.toolBarTextStyle(
                                                context,
                                                Theme.of(context)
                                                    .colorScheme
                                                    .secondaryFixed,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(24),
                              CupertinoButton(
                                onPressed: () {},
                                minSize: 0,
                                padding: EdgeInsets.zero,
                                pressedOpacity: 1,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.icRepost),
                                    const Gap(4),
                                    AnimatedSize(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: Visibility(
                                        visible: like == 0 ? false : true,
                                        child: Row(
                                          children: [
                                            const Gap(4),
                                            AnimatedFlipCounter(
                                              value: like,
                                              textStyle:
                                                  AppTheme.toolBarTextStyle(
                                                context,
                                                Theme.of(context)
                                                    .colorScheme
                                                    .secondaryFixed,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(24),
                              CupertinoButton(
                                onPressed: () {},
                                minSize: 0,
                                padding: EdgeInsets.zero,
                                pressedOpacity: 1,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.icShare),
                                    const Gap(4),
                                    AnimatedSize(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: Visibility(
                                        visible: like == 0 ? false : true,
                                        child: Row(
                                          children: [
                                            const Gap(4),
                                            AnimatedFlipCounter(
                                              value: like,
                                              textStyle:
                                                  AppTheme.toolBarTextStyle(
                                                context,
                                                Theme.of(context)
                                                    .colorScheme
                                                    .secondaryFixed,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
