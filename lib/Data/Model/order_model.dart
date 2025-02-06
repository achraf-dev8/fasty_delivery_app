
class OrderModel {
  int? id;
  int? user;
  String? address;
  double? deliveryPrice;
  String? deliveryTime;
  double? price;
  String? payementMethod;
  int? state;
  String? date;

  OrderModel(
      {this.id,
      this.user,
      this.address,
      this.deliveryPrice,
      this.deliveryTime,
      this.price,
      this.payementMethod,
      this.state,
      this.date});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    address = json['address'];
    deliveryPrice = json['delivery_price'].toDouble();
    deliveryTime = json['delivery_time'];
    price = json['price'].toDouble();
    payementMethod = json['payement_method'];
    state = json['state'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id?.toString();
    data['user'] = user?.toString();
    data['address'] = address?.toString();
    data['delivery_price'] = deliveryPrice?.toString();
    data['delivery_time'] = deliveryTime;
    data['price'] = price?.toString();
    data['payement_method'] = payementMethod;
    data['state'] = state?.toString();
    data['date'] = date;
    return data;
  }
}
