double? extractDebitAmount(String smsBody) {
  RegExp regex = RegExp(r'(?<=Amt Sent\s(Rs|INR|₹)\.)\d+(\.\d+)?');

  Match? match = regex.firstMatch(smsBody);

  if (match != null) {
    String amountStr = match.group(0)!;
    double amount = double.tryParse(amountStr) ?? 0.0;
    return amount;
  } else {
    return null;
  }
}
