extension DiscountPrice on int {
  int discount() {
    int price = this;
    return price < 300000 && price > 0
        ? 30000
        : price >= 300000 && price < 700000
            ? 10000
            : 0;
  }
}
