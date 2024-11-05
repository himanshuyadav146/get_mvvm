import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/common_widgets/common_scafold.dart';

import '../../common_widgets/common_button.dart';
import '../../viewmodels/bank_details/bank_account_viewmodel.dart';

class BankDetails extends StatelessWidget {
  final BankAccountViewModel viewModel = Get.put(BankAccountViewModel());

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: 'Bank Accounts',
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: viewModel.bankAccounts.length,
                itemBuilder: (context, index) {
                  final account = viewModel.bankAccounts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading:
                            Icon(Icons.account_balance, color: Colors.blue),
                        title: Text(account.accountNumber),
                        subtitle: Text(account.bankName),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonButton(
                text: 'Next',
                onPressed: () {
                  Get.toNamed('/other_income');
                }),

            // ElevatedButton(
            //   onPressed: () {
            //     showAddBankAccountDialog(context);
            //   },
            //   child: Text('Fixed Bottom Button'),
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: Size(double.infinity, 50), // Full width button
            //   ),
            // ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showAddBankAccountDialog(context);
        },
        icon: Icon(Icons.add),
        label: Text('Add bank account'),
      ),
      isDrawer: false,
      isResizeToAvoidBottomInset: false,
    );
  }

  // Dialog to input bank account information
  void showAddBankAccountDialog(BuildContext context) {
    final accountController = TextEditingController();
    final bankNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Bank Account'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: accountController,
                decoration: InputDecoration(labelText: 'Account Number'),
              ),
              TextField(
                controller: bankNameController,
                decoration: InputDecoration(labelText: 'Bank Name'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (accountController.text.isNotEmpty &&
                    bankNameController.text.isNotEmpty) {
                  viewModel.addBankAccount(
                    accountController.text,
                    bankNameController.text,
                  );
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
