import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/viewmodels/other_income/orther_income_viewmodel.dart';

import '../../common_widgets/common_button.dart';
import '../../common_widgets/common_scafold.dart';
import '../../common_widgets/commont_text_form_field.dart';

class OtherIncome extends StatelessWidget {
  final OtherIncomeViewModel viewModel = Get.put(OtherIncomeViewModel());
  OtherIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: 'Other Income',
      isDrawer: false,
      isResizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFormField(
                      controller: viewModel.intrestOnIncomeController,
                      labelText: 'Interest Income',
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter first name'
                          : null,
                    ),
                    SizedBox(height: 16.0),
                    CommonTextFormField(
                      controller: viewModel.intrestOnRDController,
                      labelText: 'Interest On RD / FD etc',
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter middle name'
                          : null,
                    ),
                    SizedBox(height: 16.0),
                    CommonTextFormField(
                      controller: viewModel.anyOtherIncomeController,
                      labelText: 'Any Other Income',
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter last name'
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CommonButton(
              text: 'Next',
              onPressed: () {
                Get.toNamed('/other_documents');
              },
            ),
          ),
        ],
      ),
    );
  }
}
