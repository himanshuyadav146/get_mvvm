import 'package:get/get.dart';

import '../../models/bank_details/BankAccount.dart';

class BankAccountViewModel extends GetxController {
  // Observable list of bank accounts
  var bankAccounts = <BankAccount>[].obs;

  // Function to add a bank account (for demonstration)
  void addBankAccount(String accountNumber, String bankName) {
    bankAccounts
        .add(BankAccount(accountNumber: accountNumber, bankName: bankName));
  }
}
