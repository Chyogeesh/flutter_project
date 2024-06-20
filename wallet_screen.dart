import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/providers/wallet_provider.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Wallet Address: ${walletProvider.walletAddress}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await walletProvider.getBalance();
              },
              child: Text('Get Balance'),
            ),
            Text('Balance: ${walletProvider.balance}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await walletProvider.requestAirdrop();
              },
              child: Text('Request Airdrop'),
            ),
          ],
        ),
      ),
    );
  }
}
