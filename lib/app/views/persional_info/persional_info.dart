import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_button.dart';
import '../../common_widgets/common_scafold.dart';
import '../../common_widgets/commont_text_form_field.dart';
import '../../viewmodels/persional_info/persional_info_viewmodel.dart';

class FinancialFormScreen extends StatelessWidget {
  final FinancialFormViewModel viewModel = Get.put(FinancialFormViewModel());

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: 'Personal Information',
      isDrawer: false,
      isResizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => DropdownButtonFormField<String>(
                  value: viewModel.selectedYear.value.isEmpty
                      ? null
                      : viewModel.selectedYear.value, // Initial value
                  decoration: InputDecoration(
                    labelText: 'Financial Year',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: viewModel.financialYears
                      .map((year) => DropdownMenuItem(
                            value: year,
                            child: Text(year),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    viewModel.selectedYear.value = newValue!;
                  },
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please select a year'
                      : null,
                ),
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.firstNameController,
                labelText: 'First Name',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter first name'
                    : null,
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.middleNameController,
                labelText: 'Middle Name',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter middle name'
                    : null,
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.lastNameController,
                labelText: 'Last Name',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter last name'
                    : null,
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.mobileNumberController,
                labelText: 'Mobile Number',
                keyboardType: TextInputType.phone,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter mobile number'
                    : null,
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.emailController,
                labelText: 'E-Mail ID',
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter email ID'
                    : null,
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.panNumberController,
                labelText: 'PAN Number',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter PAN number'
                    : null,
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.dobController,
                labelText: 'D.O.B',
                keyboardType: TextInputType.datetime,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter D.O.B'
                    : null,
              ),
              SizedBox(height: 24.0),
              CommonButton(
                text: 'Next',
                onPressed: () {
                  viewModel.submitForm;
                  Get.toNamed('/form_16');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
