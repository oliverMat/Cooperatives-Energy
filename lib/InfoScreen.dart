import 'package:cooperatives_energy/model/Person.dart';
import 'package:cooperatives_energy/widgets/WidgetsCustoms.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'OffersScreen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late final List<bool> _selectedOptions = <bool>[false, false];

  final TextEditingController _controllerName = TextEditingController(),
      _controllerMoney = TextEditingController();

  bool _validateName = false, _validateMoney = false;

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerMoney.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsCustoms().appBar(context, "WATTIO"),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "A sua gestão cada vez mais na palma da sua mão",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Text(
                      "Insira seus dados para começar",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: TextField(
                      controller: _controllerName,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        labelText: 'Nome',
                        hintText: 'Maria',
                        errorText: _validateName ? "Campo vazio" : null,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: TextField(
                      controller: _controllerMoney,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelText: 'Valor Medio',
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
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text("Para sua casa ou empresa?"),
                  ),
                  ToggleButtons(
                    isSelected: _selectedOptions,
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < _selectedOptions.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            _selectedOptions[buttonIndex] = true;
                          } else {
                            _selectedOptions[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    children: const <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 50.0, right: 50.0),
                          child: Row(
                            children: [Icon(Icons.person), Text("Fisica")],
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 50.0, right: 50.0),
                        child: Row(
                          children: [Icon(Icons.domain), Text("Juridica")],
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.yellow),
                      ),
                      onPressed: () {
                        setState(() {
                          _validateName = _controllerName.text.isEmpty;
                          _validateMoney = _controllerMoney.text.isEmpty;

                          if (!_selectedOptions.contains(true)) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Have a snack!'),
                            ));
                            return;
                          }

                          if (!_verifyFields()) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                settings:
                                    const RouteSettings(name: '/offersScreen'),
                                builder: (context) => OffersScreen(
                                    person: Person(
                                        _controllerName.text,
                                        _controllerMoney.text,
                                        _selectedOptions[0])),
                              ),
                            );
                          }
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                            right: 35, left: 35, top: 5, bottom: 5),
                        child:
                            Text('Proceguir', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _verifyFields() {
    if (!_validateName) {
      return false;
    }

    if (!_validateMoney) {
      return false;
    }

    return true;
  }
}
