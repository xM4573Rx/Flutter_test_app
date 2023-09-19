import 'package:flutter/material.dart';
import 'package:test_app/config/app_routes.dart';
import 'package:test_app/config/providers/user_provider.dart';
import 'package:test_app/design/colors.dart';
import 'package:test_app/design/copys.dart';
import 'package:test_app/pages/helper/validate_input.dart';
import 'package:test_app/widgets/divider_with_text.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formLogInKey = GlobalKey<FormState>();
  var checkBoxState = false;
  var userInputController = TextEditingController();
  late String userName;

  late BoxDecoration userContainerDecoration;
  late BoxDecoration pswContainerDecoration;

  final defaultContainerInputDecoration = const BoxDecoration(
    color: TestColors.brandSecondaryColor,
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  );
  final activeContainerInputDecoration = BoxDecoration(
    color: TestColors.brandSecondaryColor,
    border: Border.all(color: TestColors.brandPrimaryColor, width: 2.0),
    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
  );
  final defaultInputLabelTheme = const TextStyle(
    fontSize: 13.0,
    color: TestColors.brandLightDarkColor,
    fontWeight: FontWeight.normal,
  );

  @override
  void initState() {
    super.initState();
    userContainerDecoration = defaultContainerInputDecoration;
    pswContainerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TestColors.brandLightBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 100.0, 16.0, 0),
            child: Column(children: [
              const Text(
                TestCopys.hello,
                style: TextStyle(
                  fontSize: 30.0,
                  color: TestColors.brandPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16.00, 21.0, 16.0, 59.0),
                child: Text(
                  TestCopys.lorem,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _formLogInKey,
                child: Column(children: [
                  Container(
                    height: 70.0,
                    padding: const EdgeInsets.only(left: 24.0, bottom: 4.0),
                    decoration: userContainerDecoration,
                    child: TextFormField(
                      key: const Key('input-name'),
                      controller: userInputController,
                      style: Theme.of(context).textTheme.labelSmall,
                      validator: (value) => validateInput(value),
                      onTap: () {
                        setState(() {
                          userContainerDecoration =
                              activeContainerInputDecoration;
                          pswContainerDecoration =
                              defaultContainerInputDecoration;
                        });
                      },
                      onTapOutside: (event) {
                        setState(() {
                          userContainerDecoration =
                              defaultContainerInputDecoration;
                        });
                      },
                      onSaved: (userNameValue) {
                        userName = userNameValue!;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          TestCopys.userInputLabel,
                          style: defaultInputLabelTheme,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: const EdgeInsets.only(left: 24.0, bottom: 4.0),
                    margin: const EdgeInsets.symmetric(vertical: 24.0),
                    decoration: pswContainerDecoration,
                    child: TextFormField(
                      key: const Key('input-pass'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TestErrors.passError;
                        }
                        return null;
                      },
                      onTap: () {
                        setState(() {
                          pswContainerDecoration =
                              activeContainerInputDecoration;
                          userContainerDecoration =
                              defaultContainerInputDecoration;
                        });
                      },
                      onTapOutside: (event) {
                        setState(() {
                          pswContainerDecoration =
                              defaultContainerInputDecoration;
                        });
                      },
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: const Text(TestCopys.userPswInputLabel),
                        labelStyle: defaultInputLabelTheme,
                      ),
                    ),
                  ),
                  Row(children: [
                    Checkbox(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      value: checkBoxState,
                      onChanged: (value) {
                        setState(() {
                          checkBoxState = !checkBoxState;
                        });
                      },
                      checkColor: TestColors.brandLightColor,
                      activeColor: TestColors.brandPrimaryColor,
                    ),
                    const Expanded(child: Text(TestCopys.rememberMe)),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        TestCopys.recoveryPassword,
                        style: defaultInputLabelTheme,
                      ),
                    )
                  ]),
                  Container(
                    margin: const EdgeInsets.only(top: 32.0, bottom: 48.0),
                    width: 394,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formLogInKey.currentState!.validate()) {
                          debugPrint('Todos lo campos estan correctos');
                          userName = userInputController.text;
                          UserProvider.of(context).userData.name = userName;
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.home);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TestColors.brandPrimaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                      ),
                      child: const Text(TestCopys.logIn),
                    ),
                  ),
                  const DividerWithText(title: TestCopys.orContinue),
                  const SizedBox(height: 42),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 185,
                        height: 69,
                        decoration: const BoxDecoration(
                          color: TestColors.brandSecondaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/google.png'),
                              width: 30,
                            ),
                            SizedBox(width: 12),
                            Text(
                              TestCopys.google,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: TestColors.brandLightDarkColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 185,
                        height: 69,
                        decoration: const BoxDecoration(
                          color: TestColors.brandSecondaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/facebook.png'),
                              width: 30,
                            ),
                            SizedBox(width: 12),
                            Text(
                              TestCopys.facebook,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: TestColors.brandLightDarkColor,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 80),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text(TestCopys.notAMember),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        TestCopys.registerNow,
                        style: TextStyle(
                          color: TestColors.brandPrimaryColor,
                          fontSize: 13,
                        ),
                      ),
                    )
                  ])
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
