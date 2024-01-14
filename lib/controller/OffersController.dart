import 'package:flutter/services.dart';

import '../model/Offers.dart';

class OffersController {
  late Future<List<Offer>> getOffersListFuture;

  void init(String text) {
    getOffersListFuture = listOffersFilter(textRegex(text));
  }

  Future<List<Offer>> listAllOffers() async {
    var response = await rootBundle.loadString("assets/offers.json");

    if (response.isNotEmpty) {
      return parseOffers(response);
    } else {
      return [];
    }
  }

  Future<List<Offer>> listOffersFilter(String currentValue) async {
    var value = double.parse(
        currentValue.replaceAll("R\$\:", "").split(".").join("").trim());

    List<Offer> list = await listAllOffers();

    return list
        .where((element) =>
            double.parse(element.valorMinimoMensal) <= value &&
            double.parse(element.ValorMaximoMensal) >= value)
        .toList();
  }

  String descontoFormat(String value) {
    var v = value.replaceAll('.', '');

    if (v.length > 1) {
      return '$v %';
    } else {
      return '${v}0 %';
    }
  }

  String annualSavings(String value, String text) {
    var desconto = double.parse("0$value");

    var money = double.parse(textRegex(text));

    var annualValue = money * 12;

    return (desconto * annualValue).toString();
  }

  String textRegex(String text) =>
      text.replaceAll("R\$\:", "").split(".").join("").trim();

  String annualAverage(String value) {
    return (double.parse(value) / 12).toString();
  }

  void setNewFilter(String text) {
    var value = textRegex(text);

    if (double.parse(value) >= 1000 && double.parse(value) <= 100000) {
      getOffersListFuture = listOffersFilter(value);
    }
  }

  bool verifyRangeValue(String text) {
    var value = textRegex(text);

    return (double.parse(value) >= 1000 && double.parse(value) <= 100000);
  }
}
