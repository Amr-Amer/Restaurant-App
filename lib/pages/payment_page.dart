import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:new_restaurant_app/components/my_button.dart';
import 'package:new_restaurant_app/themes/strings.dart';

import 'delivary_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //todo: user want to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(Strings.instance.confirmedPayment),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("${Strings.instance.cardNumber} : $cardNumber"),
                Text("${Strings.instance.expiryDate} : $expiryDate"),
                Text("${Strings.instance.cardHolderName} : $cardHolderName"),
                Text("${Strings.instance.cvvCode} : $cvvCode"),
              ],
            ),
          ),
          actions: [
            // cancel
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(Strings.instance.cancel)),

            // ok
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DeliveryProgressPage(),
                      ));
                },
                child: Text(Strings.instance.ok)),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 110,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_circle_left_rounded,
                size: 40,
              ),
            )),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          Strings.instance.checkout,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // credit card
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),

          // credit card form
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (date) {
                setState(() {
                  cardNumber = date.cardNumber;
                  expiryDate = date.expiryDate;
                  cardHolderName = date.cardHolderName;
                  cvvCode = date.cvvCode;
                });
              },
              formKey: formKey),

          const Spacer(),

          MyButton(onTap: userTappedPay, text: Strings.instance.payNow),

          const SizedBox(
            height: 25.0,
          )
        ],
      ),
    );
  }
}
