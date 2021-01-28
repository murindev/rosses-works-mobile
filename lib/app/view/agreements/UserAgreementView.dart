import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UserAgreementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ПОЛЬЗОВАТЕЛЬСКОЕ СОГЛАШЕНИЕ'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 28),
        child: Column(
          verticalDirection: VerticalDirection.down,
          children: [
            _UserAgreementH2('1. Термины'),
            _UserAgreementListItem('1.1',['В Соглашении используются термины в следующих значениях:']),
            _UserAgreementListItem('1.1.1.',['Акцепт — полное и безоговорочное принятие Оферты путем осуществления действий, указанных в п. 3.1 Соглашения.']),
            _UserAgreementListItem('1.2',[
              'Условия Соглашения могут быть изменены Правообладателем в любое время в одностороннем внесудебном порядке путем опубликования изменений или новой редакции Соглашения по адресу: Адрес интернет-страницы .',
              'Изменения вступают в силу для Пользователя с даты, следующей за датой их публикации, при условии продолжения  использования Пользователем Сайта после публикации изменений либо принятия обновленной версии Соглашения. При несогласии Пользователя с внесенными изменениями он обязан отказаться от использования Сайта.']),
            _UserAgreementH2('1. Термины'),
            _UserAgreementListItem('1.1',['В Соглашении используются термины в следующих значениях:']),
            _UserAgreementListItem('1.1.1.',['Акцепт — полное и безоговорочное принятие Оферты путем осуществления действий, указанных в п. 3.1 Соглашения.']),
            _UserAgreementListItem('1.2',[
              'Условия Соглашения могут быть изменены Правообладателем в любое время в одностороннем внесудебном порядке путем опубликования изменений или новой редакции Соглашения по адресу: Адрес интернет-страницы .',
              'Изменения вступают в силу для Пользователя с даты, следующей за датой их публикации, при условии продолжения  использования Пользователем Сайта после публикации изменений либо принятия обновленной версии Соглашения. При несогласии Пользователя с внесенными изменениями он обязан отказаться от использования Сайта.']),

            _UserAgreementH2('1. Термины'),
            _UserAgreementListItem('1.1',['В Соглашении используются термины в следующих значениях:']),
            _UserAgreementListItem('1.1.1.',['Акцепт — полное и безоговорочное принятие Оферты путем осуществления действий, указанных в п. 3.1 Соглашения.']),
            _UserAgreementListItem('1.2',[
              'Условия Соглашения могут быть изменены Правообладателем в любое время в одностороннем внесудебном порядке путем опубликования изменений или новой редакции Соглашения по адресу: Адрес интернет-страницы .',
              'Изменения вступают в силу для Пользователя с даты, следующей за датой их публикации, при условии продолжения  использования Пользователем Сайта после публикации изменений либо принятия обновленной версии Соглашения. При несогласии Пользователя с внесенными изменениями он обязан отказаться от использования Сайта.']),

            _UserAgreementH2('1. Термины'),
            _UserAgreementListItem('1.1',['В Соглашении используются термины в следующих значениях:']),
            _UserAgreementListItem('1.1.1.',['Акцепт — полное и безоговорочное принятие Оферты путем осуществления действий, указанных в п. 3.1 Соглашения.']),
            _UserAgreementListItem('1.2',[
              'Условия Соглашения могут быть изменены Правообладателем в любое время в одностороннем внесудебном порядке путем опубликования изменений или новой редакции Соглашения по адресу: Адрес интернет-страницы .',
              'Изменения вступают в силу для Пользователя с даты, следующей за датой их публикации, при условии продолжения  использования Пользователем Сайта после публикации изменений либо принятия обновленной версии Соглашения. При несогласии Пользователя с внесенными изменениями он обязан отказаться от использования Сайта.']),


          ],
        ),
      ),
    );
  }
}

class _UserAgreementH2 extends StatelessWidget {
  final text;

  _UserAgreementH2(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: SizedBox(
          width: double.infinity,
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.black54),
          )),
    );
  }
}
/*
class _UserAgreementP extends StatelessWidget {

  final text;
  _UserAgreementP(this.text);

  @override
  Widget build(BuildContext context) {
    return RichText(
      // text: ,
    );
  }
}*/

class _UserAgreementListItem extends StatelessWidget {
  final boldText;
  final List textsList;

  _UserAgreementListItem(this.boldText,this.textsList);


  @override
  Widget build(BuildContext context) {

    List<TextSpan> textSpansList = [];
    textsList.forEach((text) {
      textSpansList.add(
        TextSpan(
          style:  TextStyle(fontWeight: FontWeight.normal,),
          text: text,
        ),
      );
    });



    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(text: '$boldText '  ,style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold,),
            children: textSpansList),
      ),
    );
  }
}
