import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/providers/wallet_provider.dart';
import 'package:wallet_app/screens/wallet_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await Provider.of<WalletProvider>(context, listen: false).createWallet();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => WalletScreen()),
            );
          },
          child: Text('Go to Wallet'),
        ),
      ),
    );
  }
}
