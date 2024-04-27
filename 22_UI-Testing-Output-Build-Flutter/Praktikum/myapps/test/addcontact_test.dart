import 'package:flutter_test/flutter_test.dart';
import 'package:myapps/add_contact.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:file_picker/file_picker.dart';

void main() {
  testWidgets(
    'AddContact Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: AddContact(title: 'Test Add Contact'),
      ));

      // test title
      expect(find.text('Test Add Contact'), findsOneWidget);

      // test Icons.contact_page_outlined
      expect(find.byIcon(Icons.contact_page_outlined), findsOneWidget);

      // test find textfields
      expect(find.byType(TextFormField), findsNWidgets(2));

      // test find textfield values
      expect(find.text('input your name'), findsOneWidget);
      expect(find.text('input your phone number'), findsOneWidget);

      // test input textfield user
      await tester.enterText(find.byType(TextFormField).first, 'Test Name');
      await tester.enterText(find.byType(TextFormField).last, 'Test Phone');
      await tester.pump();

      // test button
      expect(find.byType(ElevatedButton), findsOneWidget);

      // test button text
      expect(find.text('Submit'), findsOneWidget);

      // test button click
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
    },
  );
}
