import 'package:alvamind_library/widget/atom/app_image.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/organism/comments_and_reviews/comments_list.dart';
import 'package:alvamind_library/widget/organism/oultlet_summary_body/public_summary_body.dart';
import 'package:alvamind_library/widget/organism/transaction_review_card/card_review.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';

class SummaryPublic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.padding),
        child: AppColumnInk(
          children: [
            PublicSummaryBody(
              termsCondtionText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitatioaboris nisi ut Selengkapnya...',
              addressText: 'Grand City St. 100, New York, United States',
              countImages: '30+',
              images: [
                ...List.generate(3, (i) {
                  return 'https://picsum.photos/id/5$i/100/200';
                })
              ],
              onTapGalleryMore: () {
                // TODO
              },
              onTapReviewMore: () {
                // TODO
              },
              childrenReview: [
                const CardReview(
                  numberStar: 4,
                  countStar: '4.6',
                  countReview: '120',
                ),
                SizedBox(height: AppSizes.padding * 2),
                CommentListCard(
                  padding: EdgeInsets.all(0),
                  isComment: true,
                  titleUser: 'Shizuka Otomo',
                  subtitleUser: 'Occuptaion',
                  countLike: '431',
                  countStaruser: '0',
                  imageAvatar: randomImage,
                  textComment: 'Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                  dateComment: '6 hours ago',
                  isImage: true,
                  image: Row(
                    children: [
                      ...List.generate(3, (i) {
                        return Padding(
                          padding: i != 3 ? EdgeInsets.only(right: AppSizes.padding / 2) : EdgeInsets.all(0),
                          child: AppImage(
                            image: 'https://picsum.photos/id/1$i/100/200',
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
              ],
            ),
            SizedBox(
              height: AppSizes.padding * 4,
            )
          ],
        ),
      ),
    );
  }
}
