import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://api.socialverseapp.com/solana/wallet";

  static Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("https://api.socialverseapp.com/user/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"mixed": username, "password": password}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['token'];
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<String> createWallet(String token) async {
    final response = await http.post(
      Uri.parse("$baseUrl/create"),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['walletAddress'];
    } else {
      throw Exception('Failed to create wallet');
    }
  }

  static Future<double> getBalance(String token, String walletAddress) async {
    final response = await http.get(
      Uri.parse("$baseUrl/balance/$walletAddress"),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['balance'];
    } else {
      throw Exception('Failed to retrieve balance');
    }
  }

  static Future<void> transferBalance(String token, String fromWallet, String toWallet, double amount) async {
    final response = await http.post(
      Uri.parse("$baseUrl/transfer"),
      headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
      body: jsonEncode({'fromWallet': fromWallet, 'toWallet': toWallet, 'amount': amount}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to transfer balance');
    }
  }

  static Future<void> requestAirdrop(String token, String walletAddress) async {
    final response = await http.post(
      Uri.parse("$baseUrl/airdrop"),
      headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
      body: jsonEncode({'walletAddress': walletAddress}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to request airdrop');
    }
  }
}
