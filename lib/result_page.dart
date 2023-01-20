import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusalbe_widget.dart';
import 'button_bottom.dart';
//import 'calculator_brain.dart';
class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  ResultPage({required this.bmiResult,required this.resultText,required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Expanded(child:  Container(
              child:  const Text('Your Result', style: kResultTextSytle,),
            ),
            ),
            Expanded(
              flex: 5,
                child:Reuse_container(colour: kActiveCardColour,
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text(resultText,style: kOverweihtStyle),
                    Text(bmiResult,style: kBmiResultNumber),
                    
                    Text(interpretation,style: kBMIResultText,textAlign: TextAlign.center,),

                  ],

                )

                )
            ),
            BottomWidget(onTap:(){
              Navigator.pop(context);
            }, buttonTitle: 'RE-CALCULATOR')

          ],
        )
    );
  }
}
