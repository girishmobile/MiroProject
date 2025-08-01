import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:flutter/material.dart';

class PaymentSupportHelp extends StatelessWidget {
  const PaymentSupportHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancySupport(context));
  }

  _buildFancySupport(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: loadRowWithIcon(
                      title: "GENERAL PAYMENT QUESTIONS",
                      iconName: Icons.payment_outlined,
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildSupportText(
                    question: "Q: What payment methods do you accept?",
                    answer:
                        "A: We accept credit/debit cards (Visa, MasterCard, Amex), UPI, Net Banking, and Wallets (like Paytm, PhonePe, etc.). Payment options may vary based on your region.",
                  ),
                  _buildSupportText(
                    question: "Q: Is my payment information safe?",
                    answer:
                        "A: Yes. We use industry-standard encryption and secure payment gateways to protect your payment details.",
                  ),
                  _buildSupportText(
                    question:
                        "Q: Can I save my card details for future purchases?",
                    answer:
                        "A: Yes, if supported by your bank and the payment gateway, you can choose to securely save your card for faster future checkouts.",
                  ),
                  _buildSupportText(
                    question: "Q: Why was my payment declined?",
                    answer:
                        "A: Payments may be declined for various reasons including insufficient funds, incorrect card details, expired card, or network issues. Please contact your bank for more details or try another payment method.",
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: loadRowWithIcon(
                      title: "ORDER AND PAYMENT CONFIRMATION",
                      iconName: Icons.note_alt_outlined,
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildSupportText(
                    question:
                        "Q: I’ve made the payment, but didn’t receive a confirmation. What should I do?",
                    answer:
                        "A: Please allow a few minutes for the confirmation email/SMS to arrive. If you still don’t receive it, check your spam folder or contact our support with your transaction ID.",
                  ),
                  _buildSupportText(
                    question:
                        "Q: I was charged, but my order didn’t go through. What now?",
                    answer:
                        "A: In most cases, failed orders are automatically refunded within 5–7 business days. Please contact support with your payment reference number for a faster resolution.",
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: loadRowWithIcon(
                      title: "REFUND & CANCELLATIONS",
                      iconName: Icons.local_activity_outlined,
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildSupportText(
                    question: "Q: How do I request a refund?",
                    answer:
                        "A: Refunds can be requested through the 'My Orders' section by selecting the order and tapping 'Request Refund' or by contacting our support team directly.",
                  ),
                  _buildSupportText(
                    question: "Q: How long does it take to process a refund?",
                    answer:
                        "A: Refunds are typically processed within 5–7 business days, but it may take longer depending on your bank or payment provider.",
                  ),
                  _buildSupportText(
                    question: "Q: Will I be refunded the full amount?",
                    answer:
                        "A: Yes, unless the refund is partial due to specific return policies or cancellation fees, which will be communicated upfront.",
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: loadRowWithIcon(
                      title: "PAYMENT ISSUES & TROUBLESHOOTING",
                      iconName: Icons.settings_applications_outlined,
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildSupportText(
                    question:
                        "Q: My transaction is stuck in processing. What should I do?",
                    answer:
                        "A: Wait for a few minutes and check your order history. If it's still stuck, reach out to support with your transaction ID.",
                  ),
                  _buildSupportText(
                    question:
                        "Q: I accidentally made duplicate payments. Will I be refunded?",
                    answer:
                        "A: Yes. If duplicate transactions are detected, our system usually reverses one automatically. Otherwise, contact support with both transaction references.",
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "SUPPORT & HELP",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildSupportText({required String question, required String answer}) {
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          loadTitleText(fontSize: 16, title: question),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: loadSubTitleText(
              fontSize: 14,
              title: answer,
              fontColor: Colors.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
