import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/config/providers/user_provider.dart';
import 'package:test_app/design/copys.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/pages/login_page.dart';

final fakeApp = UserProvider(
  userData: User(name: ''),
  child: MaterialApp(
    home: const LogInPage(),
    routes: {
      'home': (context) => const Scaffold(),
    },
  ),
);

void main() {
  group('Finding all widgets on screen', () {
    testWidgets('find the input name by key', (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(fakeApp);
      const inputNameKey = Key('input-name');

      // Act
      final findedInputName = find.byKey(inputNameKey);

      // Assert
      expect(findedInputName, findsOneWidget);
    });

    testWidgets('find button by type', (widgetTester) async {
      //Arrange
      await widgetTester.pumpWidget(fakeApp);

      //Act
      final findedLoginButton = find.byType(ElevatedButton);

      //Assert
      expect(findedLoginButton, findsOneWidget);
    });
  });

  group('Interacting with all widgets on screen', () {
    testWidgets('fill user name', (widgetTester) async {
      // Arrange
      const userName = 'Jorge';
      await widgetTester.pumpWidget(fakeApp);
      const inputNameKey = Key('input-name');
      final findedInputName = find.byKey(inputNameKey);

      // Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();

      // Assert
      final findedUserName = find.text(userName);
      expect(findedUserName, findsOneWidget);
    });
  });

  group('Testing all widgets on screen', () {
    testWidgets('empty user, empty pass', (widgetTester) async {
      // Arrenge
      await widgetTester.pumpWidget(fakeApp);
      const expectedUserError = TestErrors.userError;
      const expectedPassError = TestErrors.passError;
      final findedLoginButton = find.byType(ElevatedButton);

      // Act
      await widgetTester.tap(findedLoginButton);
      await widgetTester.pump();

      // Assert
      final findedUserError = find.text(expectedUserError);
      final findedPassError = find.text(expectedPassError);
      expect(findedUserError, findsOneWidget);
      expect(findedPassError, findsOneWidget);
    });

    testWidgets('correct user, empty pass', (widgetTester) async {
      // Arrenge
      await widgetTester.pumpWidget(fakeApp);
      const userName = 'Jorge';
      const expectedPassError = TestErrors.passError;
      const inputNameKey = Key('input-name');
      final findedInputName = find.byKey(inputNameKey);
      final findedLoginButton = find.byType(ElevatedButton);

      // Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      await widgetTester.tap(findedLoginButton);
      await widgetTester.pump();

      // Assert
      final findedPassError = find.text(expectedPassError);
      expect(findedPassError, findsOneWidget);
    });

    testWidgets('empty user, correct pass', (widgetTester) async {
      // Arrenge
      await widgetTester.pumpWidget(fakeApp);
      const userPass = 'Jorge';
      const expectedUserError = TestErrors.userError;
      const inputPassKey = Key('input-pass');
      final findedInputPass = find.byKey(inputPassKey);
      final findedLoginButton = find.byType(ElevatedButton);

      // Act
      await widgetTester.enterText(findedInputPass, userPass);
      await widgetTester.pump();
      await widgetTester.tap(findedLoginButton);
      await widgetTester.pump();

      // Assert
      final findedPassError = find.text(expectedUserError);
      expect(findedPassError, findsOneWidget);
    });

    testWidgets('correct user, correct pass', (widgetTester) async {
      // Arrenge
      await widgetTester.pumpWidget(fakeApp);
      const userName = 'Jorge';
      const userPass = 'Jorge';
      const inputNameKey = Key('input-name');
      const inputPassKey = Key('input-pass');
      final findedInputName = find.byKey(inputNameKey);
      final findedInputPass = find.byKey(inputPassKey);
      final findedLoginButton = find.byType(ElevatedButton);

      // Act
      await widgetTester.enterText(findedInputName, userName);
      await widgetTester.pump();
      await widgetTester.enterText(findedInputPass, userPass);
      await widgetTester.pump();
      await widgetTester.tap(findedLoginButton);
      await widgetTester.pump();

      // Assert
      expect(find.text(TestErrors.userError), findsNothing);
      expect(find.text(TestErrors.passError), findsNothing);
    });
  });
}
