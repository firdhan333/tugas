import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

void main() {
  group('Login Page Widget Tests', () {
    testWidgets('Username TextField Test', (tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      final usernameFinder = find.widgetWithText(TextFormField, 'Username');
      expect(usernameFinder, findsOneWidget);

      final textFieldFinder = find.byType(TextFormField);
      await tester.tap(textFieldFinder.at(0));
      await tester.enterText(textFieldFinder.at(0), 'user');
      expect(find.text('user'), findsOneWidget);
    });

    testWidgets('Password TextField Test', (tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      final passwordFinder = find.widgetWithText(TextFormField, 'Password');
      expect(passwordFinder, findsOneWidget);

      final textFieldFinder = find.byType(TextFormField);
      await tester.tap(textFieldFinder.at(1));
      await tester.enterText(textFieldFinder.at(1), 'password');
      expect(find.text('password'), findsOneWidget);
    });

    testWidgets('Login Button Test', (tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      final loginButtonFinder = find.widgetWithText(MaterialButton, 'Login');
      expect(loginButtonFinder, findsOneWidget);

      await tester.tap(loginButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });
  });

  group('Home Page Widget Tests', () {
    testWidgets('Username Text Test', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));

      final args = {'username': 'user'};
      await tester.pumpWidget(MaterialApp(
          home: HomePage(),
          initialRoute: '/home',
          onGenerateRoute: (settings) {
            if (settings.name == '/home') {
              final args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (_) => HomePage(username: args['username']));
            }
          }));
      await tester.pumpAndSettle();

      final usernameFinder = find.text('Welcome, user');
      expect(usernameFinder, findsOneWidget);
    });
  });
}