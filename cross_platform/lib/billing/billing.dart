import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Billing extends StatefulWidget {
  const Billing({Key? key}) : super(key: key);

  @override
  _BillingState createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController cvvCodeController = TextEditingController();
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cardHolderNameController.dispose();
    cvvCodeController.dispose();
    super.dispose();
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      isCvvFocused = creditCardModel.isCvvFocused;
    });
    cardNumberController.value = TextEditingValue(
      text: creditCardModel.cardNumber,
      selection: cardNumberController.selection,
    );
    expiryDateController.value = TextEditingValue(
      text: creditCardModel.expiryDate,
      selection: expiryDateController.selection,
    );
    cardHolderNameController.value = TextEditingValue(
      text: creditCardModel.cardHolderName,
      selection: cardHolderNameController.selection,
    );
    cvvCodeController.value = TextEditingValue(
      text: creditCardModel.cvvCode,
      selection: cvvCodeController.selection,
    );
  }

  void onPayButtonPressed() {
    if (formKey.currentState?.validate() ?? false) {
      print('Card Number: ${cardNumberController.text}');
      print('Expiry Date: ${expiryDateController.text}');
      print('Card Holder Name: ${cardHolderNameController.text}');
      print('CVV Code: ${cvvCodeController.text}');
      // You can add further processing logic here, such as making a network request to process the payment
    } else {
      print('Invalid form');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Billing'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              isHolderNameVisible: true,
              cardNumber: cardNumberController.text,
              expiryDate: expiryDateController.text,
              cardHolderName: cardHolderNameController.text,
              cvvCode: cvvCodeController.text,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (CreditCardBrand) {},
              cardBgColor: Color.fromARGB(
                  255, 82, 191, 245), // Change this to your desired color
            ),
            CreditCardForm(
              onCreditCardModelChange: onCreditCardModelChange,
              cardNumber: cardNumberController.text,
              expiryDate: expiryDateController.text,
              cardHolderName: cardHolderNameController.text,
              cvvCode: cvvCodeController.text,
              formKey: formKey,
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 82, 191, 245),
                  ),
                  onPressed: onPayButtonPressed,
                  child: const Text(
                    'Pay',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
