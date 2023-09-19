import 'package:flutter/material.dart';
import 'package:test_app/design/colors.dart';
import 'package:test_app/design/copys.dart';
import 'package:test_app/mocks/transactions_mock.dart';
import 'package:test_app/widgets/divider_with_text.dart';
import 'package:test_app/widgets/transaction_detail.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 97.0,
        leadingWidth: 56.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        backgroundColor: TestColors.brandLightColor,
        leading: Container(
          width: 40.0,
          height: 40.0,
          margin: const EdgeInsets.fromLTRB(16.0, 45.0, 0, 12.0),
          decoration: BoxDecoration(
            border: Border.all(color: TestColors.brandLightColorBorder),
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
            color: TestColors.brandPrimaryColor,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 45.0, 16.0, 12.0),
          child: Text(
            TestCopys.recenTrx,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      backgroundColor: TestColors.brandLightBackgroundColor,
      body: Column(children: [
        Container(
          height: 56.0,
          margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 32.0),
          child: ListView.builder(
            padding: const EdgeInsets.all(10.0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var currentCategorie = TransactionsMocks.categories[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: MaterialButton(
                  padding: const EdgeInsets.all(10.0),
                  height: 35.0,
                  minWidth: 35.0,
                  color: index == 0
                      ? TestColors.brandPrimaryColor
                      : TestColors.brandLightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: () => {},
                  child: Text(
                    currentCategorie,
                    style: TextStyle(
                      color: index != 0
                          ? TestColors.brandPrimaryColor
                          : TestColors.brandLightColor,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              );
            },
            itemCount: TransactionsMocks.categories.length,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, month) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, day) {
                  var currentday = TransactionsMocks
                      .transactionDetailByMonth[month].listofTransactions[day];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TransactionDetailByDay(
                      listofTransactions: currentday.listofTransactions,
                      day: currentday.day,
                      isToday: currentday.isToday,
                      dayNumber: currentday.dayNumber,
                    ),
                  );
                },
                separatorBuilder: (context, indice) => const SizedBox(
                  height: 24,
                ),
                itemCount: TransactionsMocks
                    .transactionDetailByMonth[month].listofTransactions.length,
              );
            },
            separatorBuilder: (context, month) => Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 54.0, 16.0, 24.0),
              child: DividerWithText(
                title:
                    TransactionsMocks.transactionDetailByMonth[month + 1].month,
              ),
            ),
            itemCount: TransactionsMocks.transactionDetailByMonth.length,
          ),
        )
      ]),
    );
  }
}
