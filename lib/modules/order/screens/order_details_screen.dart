import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';
import 'track_order_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.darkGreenColor,
                    size: 20,
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                      color: AppColors.greenColor.withOpacity(0.3), width: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Hi Nma!',
                      style: AppTextStyles.heading1Yellow,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Your order has been placed.',
                      style: AppTextStyles.heading2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Waiting for Vendor to accept your order.',
                      style: AppTextStyles.bodyText1Bold,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(
                      color: AppColors.greenColor,
                    ),
                    const SizedBox(
                      height: 24,
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
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
