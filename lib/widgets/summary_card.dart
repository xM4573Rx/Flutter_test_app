import 'package:flutter/material.dart';
import 'package:test_app/design/colors.dart';
import 'package:test_app/widgets/custom_money_display.dart';

//tipos de SummaryCard
enum TypeSummaryCard { incomes, spending }

class SummaryCard extends StatelessWidget {
  final TypeSummaryCard typeSummaryCard;
  final double amount;
  final String period;
  final void Function()? action;
  const SummaryCard(
      {super.key,
      required this.typeSummaryCard,
      required this.amount,
      required this.period,
      required this.action});

  @override
  Widget build(BuildContext context) {
    var incomesIcon = const Icon(
      Icons.arrow_upward,
      color: TestColors.brandOnSuccessColor,
    );
    var spendingIcon =
        const Icon(Icons.arrow_downward, color: TestColors.brandOnErrorColor);
    //
    return Container(
      height: 92,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: TestColors.brandLightColorOpacity,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              border: Border.all(color: TestColors.brandPrimaryColor),
            ),
            child: typeSummaryCard == TypeSummaryCard.incomes
                ? incomesIcon
                : spendingIcon),
        Expanded(
          child: Text(
            typeSummaryCard == TypeSummaryCard.incomes ? 'Incomes' : 'Spending',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomMoneyDisplay(
              padding: const EdgeInsets.only(top: 2, right: 5),
              amount: amount,
              amountStyle: Theme.of(context).textTheme.displayMedium!,
              amountStyleSmall: Theme.of(context).textTheme.displaySmall!,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                period,
                style: const TextStyle(
                  color: TestColors.brandLightColor,
                  fontFamily: 'RobotoMono',
                  fontSize: 10,
                ),
              ),
            ),
          ]),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: TestColors.brandLightColorBorder),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
            onPressed: action,
          ),
        ),
      ]),
    );
  }
}
