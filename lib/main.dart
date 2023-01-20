
import 'package:flutter/material.dart';
import 'icon_widget.dart';
import 'reusalbe_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';
import 'button_bottom.dart';
import 'round_icon_botton.dart';
import 'calculator_brain.dart';

import 'constants.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: InputPage(),
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          primaryColor: const Color(0xFF0A0E21),
          appBarTheme: const AppBarTheme(color: Color(0xFF0A0E21)),
        ));
  }
}
enum Gender{
  Male,
  Female
}
enum Math{
  add,
  sub
}


class InputPage extends StatefulWidget {

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColour;
  Color femaleCardColor=kInactiveCardColour;
  Gender? selectedone;
  int _height=180;
  int _weight=60;
  int _age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        //backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Reuse_container(
                  colour:selectedone==Gender.Male?kActiveCardColour:kInactiveCardColour,
                  cardChild: GestureDetector(
                    child: ReusableWidget(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onTap: (){
                      setState(() {
                       // UpdateColor(Gender.Male);
                        selectedone=Gender.Male;
                      });

                    }
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Reuse_container(
                  colour: selectedone==Gender.Female?kActiveCardColour:kInactiveCardColour,
                  cardChild: GestureDetector(
                    child: ReusableWidget(
                        label: 'FEMALE', icon: FontAwesomeIcons.venus),
                    onTap: (){
                      setState(() {
                       // UpdateColor(Gender.Female);
                        selectedone=Gender.Female;
                      });
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Reuse_container(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HETGHT',style: labelTextStyle,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(_height.toString(),style: kNumberTextStyle),
                        Text('cm',style: labelTextStyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: const Color(0xFFEB1555),
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbShape:const  RoundSliderThumbShape(enabledThumbRadius:15.0),
                        overlayShape:const  RoundSliderOverlayShape(overlayRadius: 20.0)
                      ),
                      child: Slider(value: _height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue){
                                setState(() {
                                  _height=newValue.round();
                                });
                          }),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Reuse_container(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WEIGHT',style: labelTextStyle,),
                    Text(_weight.toString(),style: kNumberTextStyle,),
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children:[RoundedButton(iconData: FontAwesomeIcons.plus,onpressed: (){
                              setState(() {
                                _weight++;
                              });
                            },),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundedButton(iconData: FontAwesomeIcons.minus,onpressed: (){
                                setState(() {
                                  _weight--;
                                });
                              },)



                            ]
                        ),
                    ),

                  ],
                ),
              )),
              Expanded(
                  child: Reuse_container(
                colour: kActiveCardColour,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('AGE',style: labelTextStyle,),
                    Text(_age.toString(),style: kNumberTextStyle,),
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[RoundedButton(iconData: FontAwesomeIcons.plus,onpressed: (){
                            setState(() {
                              _age++;
                            });
                          },),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedButton(iconData: FontAwesomeIcons.minus,onpressed: (){
                              setState(() {
                                _age--;
                              });
                            },)



                          ]
                      ),
                    ),

                  ],
                ),
              )),
            ],
          ),
        ),
        BottomWidget(onTap: (){
          CalculatorBrain cd = new CalculatorBrain(height: _height, weight: _weight);
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ResultPage(bmiResult: cd.calculateBMI(),
              resultText: cd.getResult(),
            interpretation: cd.getInterpretation(),);
          }),);
        }, buttonTitle: 'CALCULATE',
        )
      ]),
    );
  }
}


