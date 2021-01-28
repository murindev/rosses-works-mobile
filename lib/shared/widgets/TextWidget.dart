import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextSimple extends StatelessWidget {

  final text;
  TextSimple(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text ',
      style: new TextStyle(
        fontSize: 18.0,
        color: Colors.black54
      ),
    );
  }
}


//
// class _PhoneNumberInput extends StatelessWidget {
//   final maskFormatter = new MaskTextInputFormatter(
//       mask: '+7 (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       inputFormatters: [maskFormatter],
//       key: const Key('loginForm_usernameInput_textField'),
//       keyboardType: TextInputType.number,
//       onChanged: (phoneNumber) => context
//           .bloc<InitializeBloc>()
//           .add(InitializePhoneNumberChanged(phoneNumber)),
//       decoration: InputDecoration(
//           labelText: 'Номер Телефона (Вводите без +7)',
//           errorText: phoneNumber.length
//               ? 'введите правильный номер'
//               : null),
//     );
//   }
// }