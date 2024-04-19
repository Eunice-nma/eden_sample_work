// ignore_for_file: use_build_context_synchronously

import 'package:dream_burger_sample_work/modules/order/viewmodel/order_viewmodel.dart';
import 'package:dream_burger_sample_work/modules/order/model/order.dart';
import 'package:dream_burger_sample_work/utils/components/app_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';
import '../../sign_in/viewmodel/sign_in_viewmodel.dart';
import '../../sign_in/screens/sign_in_screen.dart';
import 'track_order_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<SigninViewmodel>(context).user;
    var signinController = Provider.of<SigninViewmodel>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Consumer<OrderViewModel>(builder: (_, viewModel, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        final signout =
                            await signinController.signOutFromGoogle();
                        if (signout) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                          showToast(context, 'Logged out');
                        } else {
                          showToast(context, 'Could not log out');
                        }
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.darkGreenColor,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Order Details',
                          style: AppTextStyles.heading2,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildOrderStatusCard(user, viewModel, context),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.greenColor.withOpacity(0.3),
                        width: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Order Details',
                        style: AppTextStyles.bodyText1Bold,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      _buildDetailsRow(
                        'Order ID',
                        '#${viewModel.dummyOrder.id}',
                      ),
                      _buildDetailsRow(
                        'Order Date',
                        viewModel.formatter.format(
                          viewModel.dummyOrder.date,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Your order',
                  style: AppTextStyles.bodyText1Bold,
                ),
                const SizedBox(
                  height: 8,
                ),
                _buildOrderItem(viewModel.dummyOrder),
              ],
            );
          }),
        ),
      ),
    );
  }

  Container _buildOrderStatusCard(
      User user, OrderViewModel viewModel, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
            color: AppColors.greenColor.withOpacity(0.3), width: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Hi ${user.displayName}!',
            style: AppTextStyles.heading1Yellow,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            viewModel.currentStatus,
            style: AppTextStyles.heading3,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            viewModel.currentStatusDescription,
            style: AppTextStyles.bodyText1Bold,
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: AppColors.greenColor,
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TrackOrderScreen(),
                  ),
                );
              },
              child: const Text(
                'Track Your Order >',
                style: AppTextStyles.bodyText1Bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildOrderItem(Order order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.yellowColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.fastfood_rounded,
            color: AppColors.lightYellowColor,
            size: 30,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.item.name,
                style: AppTextStyles.bodyText1Bold,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Quantity: ${order.item.quantity}',
                style: AppTextStyles.bodyText2,
              ),
            ],
          ),
          const Spacer(),
          Text(
            'N ${order.item.price}',
            style: AppTextStyles.bodyText1Bold,
          ),
        ],
      ),
    );
  }

  Row _buildDetailsRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyText2,
        ),
        Text(
          value,
          style: AppTextStyles.bodyText2Bold,
        ),
      ],
    );
  }
}
