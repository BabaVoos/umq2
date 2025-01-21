import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/payment/payment_option_card.dart';
import '../../../../core/helpers/spacing.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32.r),
        child: Column(
          children: [
            PaymentOptionCard(
              icon: Icons.money,
              title: 'Cash',
              isSelected: _selectedIndex == 0,
              onTap: () => setState(() => _selectedIndex = 0),
            ),
            verticalSpacing(30),
            PaymentOptionCard(
              icon: Icons.credit_card,
              title: 'Credit Card',
              isSelected: _selectedIndex == 1,
              onTap: () => setState(() => _selectedIndex = 1),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Proceed to Payment',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
