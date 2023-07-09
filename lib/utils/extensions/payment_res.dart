extension PaymentRes on String {
  String getAuthority() {
    Uri uri = Uri.parse(this);

    return uri.queryParameters['Authority']!;
  }

  String getStatus() {
    Uri uri = Uri.parse(this);

    return uri.queryParameters['Status']!;
  }
}
