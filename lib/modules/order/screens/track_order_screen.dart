import 'package:another_stepper/another_stepper.dart';
import 'package:dream_burger_sample_work/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/components/app_stepper_dot_icon.dart';
import '../../../utils/text_styles.dart';
import '../viewmodel/order_viewmodel.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<OrderViewModel>(builder: (_, viewModel, __) {
                        return AnotherStepper(
                          stepperList: List<StepperData>.generate(
                            OrderStatus.values.length,
                            (i) => StepperData(
                              title: StepperText(
                                  'Order ${OrderStatus.values[i].nameForDisplay}',
                                  textStyle: viewModel.stepperIndex >= i
                                      ? AppTextStyles.bodyText1Bold
                                      : AppTextStyles.bodyText1),
                              subtitle: StepperText(
                                viewModel.detailedStatusDescriptions[
                                        OrderStatus.values[i]] ??
                                    '',
                                textStyle: AppTextStyles.bodyText2,
                              ),
                              iconWidget: AppStepperDotIcon(
                                  viewModel.stepperIndex >= i),
                            ),
                          ),
                          activeIndex: viewModel.stepperIndex,
                          stepperDirection: Axis.vertical,
                          activeBarColor: AppColors.greenColor,
                          inActiveBarColor: AppColors.lightGreenColor,
                          verticalGap: 40,
                          iconWidth: 40,
                          iconHeight: 40,
                        );
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
