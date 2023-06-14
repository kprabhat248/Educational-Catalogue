class FeeData {
  final String receiptNo;
  final String month;
  final String date;
  final String paymentStatus;
  final String totalAmount;
  final String btnStatus;

  FeeData(this.receiptNo, this.month, this.date, this.paymentStatus,
      this.totalAmount, this.btnStatus);
}

List<FeeData> fee = [
  FeeData('838333', 'November', '8 Nov 2022', 'Pending', '9800 \ ₹', 'PAY NOW'),
  FeeData('903922', 'September', '8 Sep 2022', 'Paid', '10080\ ₹', 'DOWNLOAD'),
  FeeData('229333', 'August', '8 Aug 2022', 'Paid', '95000\ ₹', 'DOWNLOAD'),
];
