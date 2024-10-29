import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment_flutter/pages/payment.dart';

class PaymentDetails extends StatefulWidget {
  final double totalAmount;

  PaymentDetails({Key? key, required this.totalAmount}) : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool hasDonated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
        backgroundColor: Color.fromARGB(255, 102, 114, 193),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(color: Color.fromARGB(255, 102, 114, 193).withOpacity(0.8)),
            Container(
              color: Colors.black.withOpacity(0.4),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hasDonated
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Thanks for your booking of \$${widget.totalAmount.toStringAsFixed(2)}",
                                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                SizedBox(height: 16),
                                SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent.shade400),
                                    child: Text("Book again", style: TextStyle(color: Colors.white, fontSize: 16)),
                                    onPressed: () {
                                      setState(() {
                                        hasDonated = false;
                                        amountController.clear();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Amount to Pay:', style: TextStyle(fontSize: 24, color: Colors.white70)),
                              SizedBox(height: 10.0),
                              Text('\$${widget.totalAmount.toStringAsFixed(2)}', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
                              SizedBox(height: 30.0),
                              Text('Please fill in your details:', style: TextStyle(fontSize: 18, color: Colors.white70)),
                              SizedBox(height: 20.0),
                              _buildTextField("Name", nameController),
                              _buildTextField("Address Line", addressController),
                              Row(
                                children: [
                                  Expanded(child: _buildTextField("City", cityController)),
                                  SizedBox(width: 10),
                                  Expanded(child: _buildTextField("State", stateController)),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: _buildTextField("Country", countryController)),
                                  SizedBox(width: 10),
                                  Expanded(child: _buildTextField("Pincode", pincodeController, isNumber: true)),
                                ],
                              ),
                              SizedBox(height: 12),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent.shade400),
                                  child: Text("Proceed to Pay", style: TextStyle(color: Colors.white, fontSize: 16)),
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      await _initPaymentSheet();
                                      try {
                                        await Stripe.instance.presentPaymentSheet();
                                        _showPaymentSuccessDialog(context);
                                        setState(() {
                                          hasDonated = true;
                                        });
                                        _clearFields();
                                      } catch (e) {
                                        _showPaymentFailureDialog(context);
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String title, TextEditingController controller, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: title,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $title';
          }
          return null;
        },
      ),
    );
  }

  Future<void> _initPaymentSheet() async {
    final int amountInCents = (widget.totalAmount * 100).toInt();
    // Create a payment intent on the server side
    final data = await createPaymentIntent(
      // amount: (widget.totalAmount * 100).toString(),
       amount: amountInCents.toString(),
      currency: 'USD', // Change as needed
      name: nameController.text,
      address: addressController.text,
      pin: pincodeController.text,
      city: cityController.text,
      state: stateController.text,
      country: countryController.text,
    );

    // Initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Test Merchant',
        paymentIntentClientSecret: data['client_secret'],
        customerEphemeralKeySecret: data['ephemeralKey'],
        customerId: data['id'],
      ),
    );
  }

  void _clearFields() {
    nameController.clear();
    addressController.clear();
    cityController.clear();
    stateController.clear();
    countryController.clear();
    pincodeController.clear();
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Payment Successful'),
        content: Text('Your payment of \$${widget.totalAmount.toStringAsFixed(2)} was successful!'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Go back to previous screen
            },
            child: Text('OK'),
            style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 102, 114, 193)),
          ),
        ],
      ),
    );
  }

  void _showPaymentFailureDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Payment Failed", style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.redAccent,
    ));
  }
}
