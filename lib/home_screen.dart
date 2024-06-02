import 'package:flutter/material.dart';
import 'package:digital_banking_sdk/digital_banking_sdk.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AccountManagement accountManagement = AccountManagement();
  final Transactions transactions = Transactions();
  final BalanceInquiries balanceInquiries = BalanceInquiries();

  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MFS App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await accountManagement.createAccount('Nazmul Nazim', 'nazim@example.com');
                setState(() {
                  result = 'Account created';
                });
              },
              child: Text('Create Account'),
            ),
            ElevatedButton(
              onPressed: () async {
                await transactions.transferMoney(100.0, 'Account1', 'Account2');
                setState(() {
                  result = 'Money transferred';
                });
              },
              child: Text('Transfer Money'),
            ),
            ElevatedButton(
              onPressed: () async {
                double balance = await balanceInquiries.getBalance('Account1');
                setState(() {
                  result = 'Current balance: \$${balance.toString()}';
                });
              },
              child: Text('Check Balance'),
            ),
            SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }
}
