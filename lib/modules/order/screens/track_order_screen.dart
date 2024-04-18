import 'package:another_stepper/another_stepper.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/components/app_stepper_dot_icon.dart';
import '../../../utils/text_styles.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  int activeIndex = 2;

  List stepperData = [
    {"title": "Order Placed", "subTitle": "Your order has been placed"},
    {"title": "Preparing", "subTitle": "Your order is being prepared"},
    {
      "title": "On the way",
      "subTitle": "Our delivery executive is on the way to deliver your item"
    },
    {"title": "Delivered", "subTitle": ""}
  ];
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
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
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
                        'Order progress',
                        style: AppTextStyles.heading2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              AnotherStepper(
                stepperList: List<StepperData>.generate(
                  stepperData.length,
                  (i) => StepperData(
                    title: StepperText(stepperData[i]["title"],
                        textStyle: activeIndex >= i
                            ? AppTextStyles.bodyText1Bold
                            : AppTextStyles.bodyText1),
                    subtitle: StepperText(
                      stepperData[i]["subTitle"],
                      textStyle: AppTextStyles.bodyText2,
                    ),
                    iconWidget: AppStepperDotIcon(activeIndex >= i),
                  ),
                ),
                activeIndex: activeIndex,
                stepperDirection: Axis.vertical,
                activeBarColor: AppColors.greenColor,
                inActiveBarColor: AppColors.lightGreenColor,
                verticalGap: 40,
                iconWidth: 40,
                iconHeight: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
