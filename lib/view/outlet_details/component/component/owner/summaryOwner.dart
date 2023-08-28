import 'package:alvamind_library/app/asset/app_assets.dart';

import 'package:alvamind_library/widget/molecule/app_button.dart';
import 'package:alvamind_library/widget/molecule/app_column_ink.dart';
import 'package:alvamind_library/widget/organism/bar_chart/bar_chart.dart';
import 'package:alvamind_library/widget/organism/bar_chart/bar_chart_group_data.dart';
import 'package:alvamind_library/widget/organism/bar_chart/chart.dart';

import 'package:alvamind_library/widget/organism/oultlet_summary_body/owner_summary_body.dart';

import 'package:alvamind_library/widget/organism/tags_organism.dart/tags_organism.dart';

import 'package:alvamind_library/widget/organism/transaction_review_card/list_card_progress.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/app_sizes.dart';

class SummaryOwner extends StatefulWidget {
  @override
  State<SummaryOwner> createState() => _SummaryOwnerState();
}

class _SummaryOwnerState extends State<SummaryOwner> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
        child: AppColumnInk(
          children: [
            SizedBox(height: AppSizes.padding),
            OwnerSummaryBody(
              countMachine: 15,
              countConsument: 100,
              countEmployees: 100,
              countTransaction: 25,
              barChart: barChartWrapper(),
              statusComplainWidget: ListCard(
                leftIcon: CustomIcon.walletBoldIcon,
                rightIcon: Icons.chevron_right_rounded,
                title: 'Selasa, 23 Juni 2023',
                subtitle: 'Status Complain',
                textTags: 'Proses',
                onTapChevronButton: () {
                  // TODO
                },
                onTapCard: () {
                  // TODO
                },
              ),
              deleteButton: AppButton(
                text: 'Hapus',
                textColor: AppColors.black,
                buttonColor: AppColors.redLv1.withOpacity(0.2),
                onTap: () {},
              ),
            ),
            SizedBox(
              height: AppSizes.padding * 8,
            )
          ],
        ),
      ),
    );
  }

  Widget barChartWrapper() {
    return Column(
      children: [
        BarChart(
            textTypeChart: 'Omzet',
            textDateRange: '1 Jan 2023 - 31 Juli 2023',
            countTotal: 'Rp. 687.375.337',
            countTransaction: '1000',
            onTapItem: (value) {},
            tagBar: TagsOrganism(
              listChips: const [
                'Drop Service',
                'Self Service',
                'Delivery',
                'Home Service',
              ],
              selected: -1,
              onTap: (value) {
                // TODO
                setState(() {
                  tagSelected = value;
                });
              },
            ),
            barChart: tagSelected == 0
                ? Chart(
                    listValueChart: [
                      generateGroupDataOmzet(0, 1, 3, 2, 2),
                      generateGroupDataOmzet(1, 2, 1, 1.2, 2),
                      generateGroupDataOmzet(2, 1, 2, 1.2, 2),
                      generateGroupDataOmzet(3, 2, 2, 1.1, 2),
                      generateGroupDataOmzet(4, 2, 1, 1.4, 2),
                      generateGroupDataOmzet(5, 2, 2, 1.4, 2),
                    ],
                  )
                : tagSelected == 1
                    ? Chart(
                        listValueChart: [
                          generateGroupDataOmzet(0, 1, 2, 2, 2),
                          generateGroupDataOmzet(1, 2, 1, 1.2, 2),
                          generateGroupDataOmzet(2, 1, 2, 1.2, 2),
                          generateGroupDataOmzet(3, 2, 2, 1.1, 2),
                          generateGroupDataOmzet(4, 2, 1, 1.4, 2),
                          generateGroupDataOmzet(5, 2, 2, 1.4, 2),
                        ],
                      )
                    : tagSelected == 2
                        ? Chart(
                            listValueChart: [
                              generateGroupDataOmzet(0, 1, 2, 2, 2),
                              generateGroupDataOmzet(1, 2, 1, 1.2, 2),
                              generateGroupDataOmzet(2, 1, 2, 1.2, 2),
                              generateGroupDataOmzet(3, 2, 2, 1.1, 2),
                              generateGroupDataOmzet(4, 2, 1, 1.4, 2),
                              generateGroupDataOmzet(5, 2, 2, 1.4, 2),
                            ],
                          )
                        : Chart(
                            listValueChart: [
                              generateGroupDataOmzet(0, 1, 1, 2, 2),
                              generateGroupDataOmzet(1, 2, 1, 1.2, 2),
                              generateGroupDataOmzet(2, 1, 2, 1.2, 2),
                              generateGroupDataOmzet(3, 2, 1, 1.1, 2),
                              generateGroupDataOmzet(4, 2, 1, 1.4, 2),
                              generateGroupDataOmzet(5, 2, 2, 1.4, 2),
                            ],
                          )),
        SizedBox(
          height: AppSizes.padding,
        ),
        BarChart(
          textTypeChart: 'Laba Rugi',
          textDateRange: '1 Jan 2023 - 31 Juli 2023',
          countTotal: '- Rp687.375.337',
          countTotalColor: AppColors.redLv1,
          countTransaction: '1000',
          onTapItem: (value) {},
          tagBar: TagsOrganism(
            listChips: const [
              'Pemasukan',
              'Pengeluaran',
            ],
            onTap: (value) {
              // TODO
              setState(() {
                tagSelected2 = value;
              });
            },
          ),
          barChart: tagSelected2 == 0
              ? Chart(
                  listValueChart: [
                    generateGroupDataProfit(0, 5, 5),
                    generateGroupDataProfit(1, 4, 2),
                    generateGroupDataProfit(4, 2, 2),
                    generateGroupDataProfit(2, 2, 1),
                    generateGroupDataProfit(3, 1, 2),
                    generateGroupDataProfit(5, 2, 1),
                  ],
                )
              : Chart(
                  listValueChart: [
                    generateGroupDataProfit(0, 4, 5),
                    generateGroupDataProfit(1, 1, 2),
                    generateGroupDataProfit(2, 2, 1),
                    generateGroupDataProfit(3, 2, 2),
                    generateGroupDataProfit(4, 2, 2),
                    generateGroupDataProfit(5, 2, 1),
                  ],
                ),
        ),
      ],
    );
  }
}
