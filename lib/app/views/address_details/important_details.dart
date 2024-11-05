import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/viewmodels/address_details/address_details_viewmodel.dart';

import '../../common_widgets/common_button.dart';
import '../../common_widgets/common_scafold.dart';
import '../../common_widgets/commont_text_form_field.dart';

class ImportantDetails extends StatelessWidget {
  final AddressDetailsViewModel viewModel = Get.put(AddressDetailsViewModel());
  ImportantDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: 'Address Details',
      isDrawer: false,
      isResizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextFormField(
                controller: viewModel.fatherNameController,
                labelText: 'Father Name (as per PAN)',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter father name'
                    : null,
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.aadharCardController,
                labelText: 'Aadhar Card Number',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter aadhar card no'
                    : null,
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.addressLine1Controller,
                labelText: 'Address Line 1',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter address'
                    : null,
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.addressLine2Controller,
                labelText: 'Address Line 2',
                keyboardType: TextInputType.phone,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter address'
                    : null,
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.stateController,
                labelText: 'State',
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter State'
                    : null,
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.cityController,
                labelText: 'City',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter city' : null,
              ),
              SizedBox(height: 16.0),
              CommonTextFormField(
                controller: viewModel.pinController,
                labelText: 'Pincode',
                keyboardType: TextInputType.datetime,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter Pin Code'
                    : null,
              ),
              SizedBox(height: 24.0),
              CommonButton(
                text: 'Next',
                onPressed: () {
                  Get.toNamed('/bank_details');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
