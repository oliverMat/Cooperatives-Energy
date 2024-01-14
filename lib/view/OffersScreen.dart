import 'package:cooperatives_energy/controller/OffersController.dart';
import 'package:cooperatives_energy/model/Offers.dart';
import 'package:cooperatives_energy/model/Person.dart';
import 'package:cooperatives_energy/widgets/WidgetsCustoms.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class OffersScreen extends StatefulWidget {
  final Person? person;

  const OffersScreen({Key? key, this.person}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final _controller = OffersController();

  final TextEditingController _controllerMoney = TextEditingController();

  bool _validateMoney = false;

  @override
  void initState() {
    _controller.init(widget.person!.money);

    _controllerMoney.text = widget.person!.money;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsCustoms().appBar(context, widget.person!.name),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controllerMoney,
            style: const TextStyle(color: Colors.white, fontSize: 25),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Theme.of(context).backgroundColor,
                hintText: r'R$: 1000',
                errorText: _validateMoney ? "Campo vazio" : null),
            inputFormatters: <TextInputFormatter>[
              CurrencyTextInputFormatter(
                locale: 'pt-br',
                decimalDigits: 000000,
                symbol: r'R$:',
              ),
            ],
            keyboardType: TextInputType.number,
            onChanged: (text) {
              setState(() {
                if (_controller.verifyRangeValue(text)) {
                  _controller.setNewFilter(text);
                  _validateMoney = false;
                } else {
                  _validateMoney = true;
                }
              });
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 3,
            child: FutureBuilder(
              future: _controller.getOffersListFuture,
              builder: (BuildContext context, AsyncSnapshot<List<Offer>> s) {
                if (s.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
            
                return FlutterCarousel.builder(
                  options: CarouselOptions(
                    height: 300.0,
                  ),
                  itemCount: s.data!.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) =>
                          Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Oferta ${itemIndex + 1}',
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.amber),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Coperativa: ${s.data![itemIndex].nome}',
                                      style: const TextStyle(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                    const Text(
                                      'Para sua: casa ou empresa ',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                    Text(
                                      'Economia: ${_controller.descontoFormat(s.data![itemIndex].desconto)}',
                                      style: const TextStyle(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                    Text(
                                        "Economia Anual: R\$: ${_controller.annualSavings(s.data![itemIndex].desconto, _controllerMoney.text)}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 18.0, color: Colors.black)),
                                    Text(
                                        "Media por mes: R\$: ${_controller.annualAverage(_controller.annualSavings(s.data![itemIndex].desconto, _controllerMoney.text))}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 18.0, color: Colors.black)),
                                  ],
                                ),
                              )),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 2,
            child: Center(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow),
                ),
                onPressed: () {
                  setState(() {});
                },
                child: const Padding(
                  padding:
                      EdgeInsets.only(right: 100, left: 100, top: 5, bottom: 5),
                  child: Text('Contratar', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}