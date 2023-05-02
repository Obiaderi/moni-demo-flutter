import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moni_app/constants/colors.dart';
import 'package:moni_app/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

import 'features/cluster_provider.dart';
import 'widgets/custom_expand_dropdown.dart';
import 'widgets/row_text_amount.dart';
import 'widgets/text_row_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  void initState() {
    _getClusterData();
    super.initState();
  }

  void _getClusterData() async {
    await Provider.of<ClusterProvider>(context, listen: false)
        .addClusterModel();
  }

  @override
  Widget build(BuildContext context) {
    TabController customTabController = TabController(length: 2, vsync: this);
    final clusterData = Provider.of<ClusterProvider>(context).clusterResponse;
    return Scaffold(
      backgroundColor: bgGray,
      body: SafeArea(
        child: !clusterData.success
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ).copyWith(bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.arrow_back,
                                color: white,
                              ),
                            ),
                            const CustomTextWidget(
                              text: "My cluster",
                              fontSize: 20,
                            ),
                            Container()
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                CustomTextWidget(
                                  text: clusterData.data.clusterName,
                                ),
                                const SizedBox(height: 5),
                                TextRowContainer(
                                  text: "Repayment rate:",
                                  text2:
                                      "${clusterData.data.clusterRepaymentRate}%",
                                  text2Color: yellowish,
                                ),
                                const SizedBox(height: 5),
                                TextRowContainer(
                                  text: "Repayment Day:",
                                  text2: clusterData.data.clusterRepaymentDay,
                                  text2Color: greenish,
                                ),
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage("images/avatar.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: lightGrey),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomTextWidget(
                                  text: "Cluster purse balance",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(height: 5),
                                CustomTextWidget(
                                  text: formatCurrency
                                      .format(
                                          clusterData.data.clusterPurseBalance)
                                      .toString(),
                                  fontSize: 17,
                                ),
                                const SizedBox(height: 5),
                                const CustomTextWidget(
                                  text: "+₦550,000,000 interest today",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: greenish,
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 8,
                                ),
                                backgroundColor: btnOrangebg,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const CustomTextWidget(
                                text: "View Purse",
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: lightGrey),
                        const SizedBox(height: 8),
                        RowTextAmount(
                          title: "Total interest earned",
                          amount: formatCurrency
                              .format(clusterData.data.totalInterestEarned),
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: lightGrey),
                        const SizedBox(height: 8),
                        RowTextAmount(
                          title: "Total owed by members",
                          amountColor: white,
                          amount: formatCurrency
                              .format(clusterData.data.totalOwedByMembers),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    color: white,
                    child: TabBar(
                      controller: customTabController,
                      labelColor: redText,
                      unselectedLabelColor: lightGrey,
                      indicatorColor: redText,
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      tabs: const [
                        Tab(text: "Members (9)"),
                        Tab(text: "Cluster Deatils"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: white,
                      child: TabBarView(
                        controller: customTabController,
                        children: [
                          ListView(
                            children: const [
                              CustomExpandDropdown(),
                            ],
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
