import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:digital_banking_sdk/digital_banking_sdk.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nagad MFS Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildDashboardItem(context, 'Send Money', FontAwesomeIcons.moneyBillWave, _sendMoney),
          _buildDashboardItem(context, 'Cash In', FontAwesomeIcons.cashRegister, _cashIn),
          _buildDashboardItem(context, 'Cash Out', FontAwesomeIcons.moneyCheckAlt, _cashOut),
          _buildDashboardItem(context, 'Bill Payment', FontAwesomeIcons.fileInvoiceDollar, _billPayment),
          _buildDashboardItem(context, 'Digital Bank', FontAwesomeIcons.university, () => _digitalBank(context)),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(8.0),
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(icon, size: 48.0),
            SizedBox(height: 16.0),
            Text(title, style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }

  void _sendMoney() {
    // Implement send money functionality
  }

  void _cashIn() {
    // Implement cash in functionality
  }

  void _cashOut() {
    // Implement cash out functionality
  }

  void _billPayment() {
    // Implement bill payment functionality
  }

  void _digitalBank(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DigitalBankDashboard()),
    );
  }
}
