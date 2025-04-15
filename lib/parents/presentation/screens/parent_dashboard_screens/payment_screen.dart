import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagment/core/constraints.dart';
import 'package:schoolmanagment/parents/presentation/provider/payment_provider.dart';
import 'package:schoolmanagment/widgets/headerandbackwidget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<PaymentProvider>(
          builder: (context, paymentProvider, _) {
            return LayoutBuilder(
              builder: (context, constraints) {
                bool isTablet = constraints.maxWidth > 600;
                return Padding(
                  padding:
                      isTablet
                          ? const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 50,
                          )
                          : const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: isTablet ? 40 : 20),
                        HeaderandBackwidget(text: 'Fees Payment'),
                        SizedBox(height: isTablet ? 60 : 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Color(0xFFEBEBEB)),
                          ),
                          child: Padding(
                            padding:
                                isTablet
                                    ? const EdgeInsets.all(40)
                                    : const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: isTablet ? 84 : 42,
                                      width: isTablet ? 84 : 42,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    SizedBox(width: isTablet ? 16 : 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Midterm Tuition Fee',
                                          style: TextStyle(
                                            fontSize: isTablet ? 32 : 16,
                                            color: kPrimaryTextColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          ' Due: Mar 21, 2025',
                                          style: TextStyle(
                                            fontSize: isTablet ? 24 : 12,
                                            color: Color(0xFFCB1A20),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(height: isTablet ? 32 : 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tuition Fee',
                                      style: TextStyle(
                                        fontSize: isTablet ? 28 : 14,
                                      ),
                                    ),
                                    Text(
                                      'Rs 150',
                                      style: TextStyle(
                                        fontSize: isTablet ? 28 : 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: isTablet ? 16 : 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Activity Fee',
                                      style: TextStyle(
                                        fontSize: isTablet ? 28 : 14,
                                      ),
                                    ),
                                    Text(
                                      'Rs 50',
                                      style: TextStyle(
                                        fontSize: isTablet ? 28 : 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: isTablet ? 16 : 8),
                                Divider(),
                                SizedBox(height: isTablet ? 16 : 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                        fontSize: isTablet ? 28 : 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Rs 50',
                                      style: TextStyle(
                                        fontSize: isTablet ? 28 : 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: isTablet ? 48 : 24),
                        Text(
                          'Select Payment methods',
                          style: GoogleFonts.josefinSans(
                            fontSize:
                                isTablet ? 40 : 20, // Larger text for tablet
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: isTablet ? 32 : 16),
                        PaymentWidgets(
                          isTablet: isTablet,
                          image: 'assets/images/parent/payment/creditcard.png',
                          paymentTypeName: 'Credit Card',
                          index: 0,
                          paymentProvider: paymentProvider,
                        ),
                        SizedBox(height: isTablet ? 32 : 16),
                        PaymentWidgets(
                          isTablet: isTablet,
                          image: 'assets/images/parent/payment/debitcard.png',
                          paymentTypeName: 'Debit Card',
                          index: 1,
                          paymentProvider: paymentProvider,
                        ),
                        SizedBox(height: isTablet ? 32 : 16),
                        PaymentWidgets(
                          isTablet: isTablet,
                          image: 'assets/images/parent/payment/newbanking.png',
                          paymentTypeName: 'Net Banking',
                          index: 2,
                          paymentProvider: paymentProvider,
                        ),
                        SizedBox(height: isTablet ? 32 : 16),
                        PaymentWidgets(
                          isTablet: isTablet,
                          image: 'assets/images/parent/payment/phonepe.png',
                          paymentTypeName: 'Phone Pe',
                          index: 3,
                          paymentProvider: paymentProvider,
                        ),
                        SizedBox(height: isTablet ? 32 : 16),
                        PaymentWidgets(
                          isTablet: isTablet,
                          image: 'assets/images/parent/payment/googlepay.png',
                          paymentTypeName: 'Phone Pe',
                          index: 4,
                          paymentProvider: paymentProvider,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class PaymentWidgets extends StatelessWidget {
  final String? image;
  final String? paymentTypeName;
  final int? index;
  final PaymentProvider paymentProvider;

  const PaymentWidgets({
    super.key,
    required this.isTablet,
    required this.image,
    required this.paymentTypeName,
    required this.index,
    required this.paymentProvider,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFFEBEBEB),
        border: Border.all(color: Color(0xFFEBEBEB)),
      ),
      child: Padding(
        padding: isTablet ? const EdgeInsets.all(40) : const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: isTablet ? 72 : 36,
                      width: isTablet ? 72 : 36,
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        image: DecorationImage(image: AssetImage('$image')),
                      ),
                    ),
                    SizedBox(width: isTablet ? 20 : 10),
                    Text(
                      '$paymentTypeName',
                      style: TextStyle(
                        fontSize: isTablet ? 32 : 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                InkWell(
                  onTap: () {
                    // //for visible container
                    // enrollstdprovider.toggleVisibility(index);
                    paymentProvider.toggleVisibility(index!);
                    print(index!);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFEE742A),
                        width: isTablet ? 4 : 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: isTablet ? 40 : 20,
                      backgroundColor: const Color.fromARGB(87, 255, 255, 255),
                      child:
                          paymentProvider.visibleIndex == index
                              ? Icon(
                                Icons.keyboard_arrow_up,
                                color: Color(0xFFEE742A),
                                size: isTablet ? 50 : 25,
                              )
                              : Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xFFEE742A),
                                size: isTablet ? 50 : 25,
                              ),
                    ),
                  ),
                ),
              ],
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child:
                  paymentProvider.visibleIndex == index
                      ? Column(
                        children: [
                          PaymentFormsWidgets(
                            isTablet: isTablet,
                            text1: 'Card Holder Name',
                            hintText: 'Enter Card Holder Name',
                            validator: (p0) {},
                            // controller: ,
                          ),
                          PaymentFormsWidgets(
                            isTablet: isTablet,
                            text1: 'Card Number',
                            hintText: 'Enter Card Number',
                            validator: (p0) {},
                            // controller: ,
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: PaymentFormsWidgets(
                                  isTablet: isTablet,
                                  text1: 'Expiration Date',
                                  hintText: 'Expiration Date',
                                  validator: (p0) {},
                                  // controller: ,
                                ),
                              ),
                              SizedBox(width: isTablet ? 20 : 10),
                              Expanded(
                                child: PaymentFormsWidgets(
                                  isTablet: isTablet,
                                  text1: 'CVV',
                                  hintText: 'Enter CVV 000',
                                  validator: (p0) {},
                                  // controller: ,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: isTablet ? 20 : 10),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: isTablet ? 72 : 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black,
                              ),
                              child: Center(
                                child: Text(
                                  'Pay Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isTablet ? 24 : 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentFormsWidgets extends StatelessWidget {
  final String? text1;
  final String? hintText;
  final String? Function(String?)? validator;
  // final TextEditingController controller;
  const PaymentFormsWidgets({
    super.key,
    required this.isTablet,
    required this.text1,
    required this.hintText,
    // required this.controller,
    required this.validator,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Text('$text1'),
        SizedBox(height: isTablet ? 20 : 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: '$hintText',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xFFE0E0E0)),
            ),
          ),
        ),
      ],
    );
  }
}
