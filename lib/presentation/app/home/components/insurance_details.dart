import '../../../constants/style_constants.dart';
import 'package:flutter/material.dart';

import '../../../constants/spacers.dart';
import '../../communication/components/function_menu/components/function_menu_item.dart';
import '../../components/friz_text.dart';
import '../../components/helvetica_text.dart';

class InsuranceDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const FrizText(
            text: 'Добровільне медичне страхування',
            size: 18,
            color: textColor,
          ),
          const HelveticaText(
            text: 'Договір #156/20 - ДМС/Ц8',
            size: 14,
            color: subtitleColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HelveticaText(
                text: 'м. Київ',
                size: 14,
                color: subtitleColor,
              ),
              const HelveticaText(
                text: '23.03.2020',
                size: 14,
                color: subtitleColor,
              ),
            ],
          ),
          SpaceH24(),
          const HelveticaText(
            text:
                'Цей Договір добровільного медичного страхування (надалі-Договір) укладено відповідно до «Правил добровільного медичного страхування», що  зареєстровані Нацкомфінпослуг 21.11.2013р., "Правил добровільного страхування здоров’я на випадок хвороби", що  зареєстровані Нацкомфінпослуг 30.10.2008 за № 0481599 (надалі – «Правила») та Ліцензій Серії АЕ № 284205 від 11.12.2013р., Серії АЕ № 198585  від  30.10.2008р.',
            size: 14,
            color: textColor,
          ),
          SpaceH45(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const FrizText(
                text: 'Умови страхування',
                size: 18,
                color: textColor,
              ),
              FunctionMenuItem(
                buttonFunc: () {
                  //TODO onTap
                },
                title: '',
                buttonTitle: '',
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: Color.fromRGBO(227, 227, 229, 1),
          ),
        ],
      ),
    );
  }
}
