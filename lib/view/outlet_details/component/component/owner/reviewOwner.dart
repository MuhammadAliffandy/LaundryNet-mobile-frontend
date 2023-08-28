import 'package:alvamind_library/view/samples/review_tabs_samples_view.dart';
import 'package:alvamind_library/widget/atom/app_avatar.dart';
import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/molecule/app_expansion_list_tile.dart';

import 'package:alvamind_library/widget/organism/accordion/accordion_question_card.dart';
import 'package:alvamind_library/widget/organism/comments_and_reviews/comments_list.dart';

import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/card_review.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';

class ReviewOwner extends StatefulWidget {
  @override
  State<ReviewOwner> createState() => _ReviewOwnerState();
}

class _ReviewOwnerState extends State<ReviewOwner> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: AppColumnInk(
        children: [
          SizedBox(height: AppSizes.padding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
            child: const CardReview(
              numberStar: 4,
              countStar: '4.6',
              countReview: '120',
            ),
          ),
          StickyHeader(
            header: Container(
              color: AppColors.white,
              padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
              child: TagsOrganism(
                paddingTagsBody: EdgeInsets.only(left: AppSizes.padding),
                leftIcon: Icons.star_rounded,
                selectedColor: [
                  ...List.generate(5, (index) {
                    return AppColors.primary;
                  })
                ],
                listChips: const [
                  'Semua',
                  '5',
                  '4',
                  '3',
                  '2',
                ],
                onTap: (value) {
                  // TODO
                },
              ),
            ),
            content: listComment(),
          ),
        ],
      ),
    );
  }

  Widget listComment() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Column(
        children: [
          ...List.generate(3, (i) {
            return Column(
              children: [
                CommentListCard(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
                  isComment: true,
                  titleUser: dummyName[i],
                  subtitleUser: 'Occuptaion',
                  countLike: '431',
                  countStaruser: '${i + 3}',
                  imageAvatar: 'https://picsum.photos/id/1$i/100/200',
                  textComment: 'Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore o eiusmod tempor incididunt ut labore et dolore.',
                  dateComment: '6 hours ago',
                  isImage: true,
                  image: Row(
                    children: [
                      ...List.generate(3, (i) {
                        return Padding(
                          padding: i != 3 ? EdgeInsets.only(right: AppSizes.padding / 2) : EdgeInsets.only(bottom: AppSizes.padding * 4),
                          child: AppImage(
                            image: 'https://picsum.photos/id/2$i/200/200',
                            width: 70,
                            height: 70,
                            borderRadius: 24,
                            backgroundColor: AppColors.redLv5,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                i == 0
                    ? Padding(
                        padding: EdgeInsets.only(bottom: AppSizes.padding),
                        child: AppExpansionListTile(
                          backgroundColor: AppColors.transparent,
                          paddingChild: EdgeInsets.all(AppSizes.padding),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.transparent,
                              offset: Offset(0, 0),
                              blurRadius: 0,
                              spreadRadius: 0,
                            ),
                          ],
                          leftItem: Padding(
                            padding: EdgeInsets.only(right: AppSizes.padding / 1.5),
                            child: const AppAvatar(
                              image: randomImage,
                              size: 40,
                            ),
                          ),
                          divider: false,
                          title: 'Full Name',
                          children: [
                            QuestionText(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.blackLv7.withOpacity(0.5),
                                  offset: Offset(0, 4),
                                  blurRadius: 60,
                                  spreadRadius: 0,
                                ),
                              ],
                              padding: EdgeInsets.only(
                                top: 0,
                                right: AppSizes.padding,
                                left: AppSizes.padding,
                                bottom: AppSizes.padding,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
                            )
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            );
          }),
          SizedBox(height: AppSizes.padding * 4)
        ],
      ),
    );
  }
}
