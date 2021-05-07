import 'package:flutter/material.dart';

import 'function_menu_item.dart';

class InsuranceDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Добровільне медичне страхування',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'FrizQuadrataCTT',
              color: Color.fromRGBO(40, 46, 58, 1),
            ),
          ),
          Text(
            'Договір #156/20 - ДМС/Ц8',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'HelveticaRegular',
              color: Color.fromRGBO(96, 110, 117, 1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'м. Київ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'HelveticaRegular',
                  color: Color.fromRGBO(96, 110, 117, 1),
                ),
              ),
              Text(
                '23.03.2020',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'HelveticaRegular',
                  color: Color.fromRGBO(96, 110, 117, 1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            'Цей Договір добровільного медичного страхування (надалі-Договір) укладено відповідно до «Правил добровільного медичного страхування», що  зареєстровані Нацкомфінпослуг 21.11.2013р., "Правил добровільного страхування здоров’я на випадок хвороби", що  зареєстровані Нацкомфінпослуг 30.10.2008 за № 0481599 (надалі – «Правила») та Ліцензій Серії АЕ № 284205 від 11.12.2013р., Серії АЕ № 198585  від  30.10.2008р.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'HelveticaRegular',
              color: Color.fromRGBO(40, 46, 58, 1),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Умови страхування',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'FrizQuadrataCTT',
                  color: Color.fromRGBO(40, 46, 58, 1),
                ),
              ),
              FunctionMenuItem(),
            ],
          ),
          Divider(
            height: 1,
            color: Color.fromRGBO(227, 227, 229, 1),
          ),
        ],
      ),
    );
  }
}
