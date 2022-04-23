import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/cupertino.dart';

//Define most usage color for easier to call and use
final Color blackHexColor = HexColor("#1C1C1C");
final Color yellowHexColor = HexColor("#fcbd1c");
final Color whiteHexColor = HexColor("#ffffff");

class Calculation extends StatefulWidget {
  const Calculation({Key key}) : super(key: key);

  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  //Define weight and height variable
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double bmi_result = 0;
  String _textResult = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(
                fontSize: 25.0,
                color: yellowHexColor,
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0, //not have shadow effects
          centerTitle: true,
        ),
        backgroundColor: blackHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),

              //Receiving an input from (keyboardType: TextinputType.number)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130.0,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 42.0,
                        color: yellowHexColor,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "HEIGHT",
                          hintStyle: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 130.0,
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 42.0,
                        color: yellowHexColor,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "WEIGHT",
                          hintStyle: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8),
                          )),
                    ),
                  )
                ],
              ),

              //Input value type - (cm), (kg)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130.0,
                    child: Text(
                      "CM",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.0,
                        color: whiteHexColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 130.0,
                    child: Text(
                      "KG",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.0,
                        color: whiteHexColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),

              //Blank Space
              const SizedBox(
                height: 30.0,
              ),
              //Setting value of height and weight to default first,
              GestureDetector(
                onTap: () {
                  double _h = _heightController.text.isNotEmpty
                      ? double.parse(_heightController.text)
                      : 0.00;
                  double _w = _weightController.text.isNotEmpty
                      ? double.parse(_weightController.text)
                      : 0.00;

                  //BMI Computation
                  setState(() {
                    bmi_result = _w /(_h * _h / 10000); //deivided by 10,000 to convert value base to bmi standard value
                    if ((_h <= 0) || (_w <= 0)) {
                      bmi_result = 0.0;
                      _textResult = " ";
                    } else if (bmi_result > 30) {
                      _textResult = "OBESITY!";
                    } else if (bmi_result >= 25 && bmi_result <= 29.9) {
                      _textResult = "OVERWEIGHT!";
                    } else if (bmi_result >= 18.6 && bmi_result <= 24.9) {
                      _textResult = "NORMAL WEIGHT!";
                    } else {
                      _textResult = "UNDERWEIGHT!";
                    }
                  });
                },
                //Calculate button and decoration
                child: Container(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: whiteHexColor,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              //Blank Space
              SizedBox(
                height: 50.0,
              ),

              //Result numerical value
              Container(
                child: Text(
                  bmi_result.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                    color: yellowHexColor,
                  ),
                ),
              ),

              //Blank Space
              SizedBox(
                height: 30.0,
              ),

              //Result classified value
              Visibility(
                visible: _textResult.isNotEmpty,
                child: Container(
                  child: Text(
                    _textResult,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: whiteHexColor),
                  ),
                ),
              ),

              //Blank Space
              SizedBox(
                height: 100.0,
              ),

              //Detail page linked button
              Center(
                child: ElevatedButton(
                  child: const Text('FOR MORE DETAIL'),
                  onPressed: () {
                    // Navigate to second route when tapped.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailRoute()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    textStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: yellowHexColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class DetailRoute extends StatelessWidget {
  const DetailRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              fontSize: 25.0,
              color: yellowHexColor,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, //not have shadow effects
        centerTitle: true,
      ),
      backgroundColor: blackHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),

            SizedBox(
              height: 30.0,
            ),
            //Row 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: ElevatedButton(
                    child: const Text('UNDERWEIGHT'),
                    onPressed: () {
                      // Navigate to second route when tapped.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UnderweightRoute()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                      padding:
                      EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: yellowHexColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),

            //Row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: ElevatedButton(
                    child: const Text('NORMAL WEIGHT'),
                    onPressed: () {
                      // Navigate to second route when tapped.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NormalweightRoute()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                      padding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: yellowHexColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),

            //Row 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: ElevatedButton(
                    child: const Text('OVERWEIGHT'),
                    onPressed: () {
                      // Navigate to second route when tapped.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OverweightRoute()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                      padding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: yellowHexColor,
                      ),
                    ),
                  ),
                ),
        ],
      ),
            SizedBox(
              height: 20.0,
            ),

            //Row 4
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: ElevatedButton(
                    child: const Text('OBESITY'),
                    onPressed: () {
                      // Navigate to second route when tapped.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ObesityRoute()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                      padding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: yellowHexColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

class UnderweightRoute extends StatelessWidget {
  const UnderweightRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              fontSize: 25.0,
              color: yellowHexColor,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, //not have shadow effects
        centerTitle: true,
      ),
      backgroundColor: blackHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            //Row 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: ElevatedButton(
                    child: const Text('Home'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Calculation()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                      padding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: yellowHexColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),

            //Row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    ("Underweight                      "),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: yellowHexColor,
                    ),

                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20.0,
            ),

            //Row 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    (" We recommend you to, \n\n 1. Eating at least 5 portions of \n     a variety of fruit and vegetables\n     every day. \n\n 2. Basing meals on potatoes,\n     bread, rice, pasta or other starchy\n     carbohydrates. \n\n 3. Choose wholegrain where\n     possible. \n\n 4. Having some dairy or\n     dairy alternatives."),
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      color: whiteHexColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NormalweightRoute extends StatelessWidget {
  const NormalweightRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              fontSize: 25.0,
              color: yellowHexColor,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, //not have shadow effects
        centerTitle: true,
      ),
      backgroundColor: blackHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            //Row 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: ElevatedButton(
                    child: const Text('Home'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Calculation()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                      padding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: yellowHexColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),

            //Row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    ("Normalweight                       "),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: yellowHexColor,
                    ),

                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20.0,
            ),

            //Row 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    (" We recommend you to, \n\n 1. Emphasizes fruits, vegetables, \n     whole grains and fat-free or low-fat \n     milk and milk products \n\n 2. Includes a variety of protein foods \n     such as seafood, lean meats and \n     poultry, eggs, legumes, soy products, \n     nuts, and seeds. \n\n3. Stays within your daily calorie needs\n"),
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      color: whiteHexColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OverweightRoute extends StatelessWidget {
  const OverweightRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              fontSize: 25.0,
              color: yellowHexColor,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, //not have shadow effects
        centerTitle: true,
      ),
      backgroundColor: blackHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            //Row 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: ElevatedButton(
                    child: const Text('Home'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Calculation()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                      padding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: yellowHexColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),

            //Row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    ("Overweight                       "),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: yellowHexColor,
                    ),

                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20.0,
            ),

            //Row 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    (" We recommend you to, \n\n 1. setting realistic weight loss goals\n\n 2. eating more slowly and being\n     mindful of what and when you're\n     eating \n\n3. avoiding situations where\n     you know you may be tempted\n     to overeat\n\n4. involving your family and friends\n     with your weight loss efforts\n\n5. monitoring your progress"),
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      color: whiteHexColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ObesityRoute extends StatelessWidget {
  const ObesityRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              fontSize: 25.0,
              color: yellowHexColor,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, //not have shadow effects
        centerTitle: true,
      ),
      backgroundColor: blackHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            //Row 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: ElevatedButton(
                    child: const Text('Home'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Calculation()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                      padding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: yellowHexColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),

            //Row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    ("Obesity                                "),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: yellowHexColor,
                    ),

                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20.0,
            ),

            //Row 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    (" We recommend you to, \n\n 1. Swap refined carb sources for\nwhole grains \n\n2. Just like grains, whole dals are\nalso a better bet than the washed\ndals. Rajma, and chana dals are\nsome of the healthiest dals you\ncan fill up your shelves with. \n\n3. Avoid red meat and opt for lean\nmeat like chicken and salmon.\nAdding protein with every meal\ncould prove to be a game changer\nfor anyone trying to lose weight. \n\n4. Load up on seasonal vegetables.\nThey provide both soluble and\ninsoluble fibres in addition to\nvitamins, minerals and antioxidants. \n\n5. Stay away from trans fats as\nthey are one of the biggest culprits\nof growing instances of obesity\nglobally. Fast food, instant food,\nfried junk, cookies, pasta, burger\nand noodles- these trans-fats\nare spread all across us. \n\n6. Sugar intake should be less\nthan 10% of your total calories\nfor a normal weight woman who\nneeds 1900Kcal/day, this is\nabout 10 -11 teaspoons of sugar.\nBelow 5% would be better."),
                    style: TextStyle(
                      fontSize: 20,
                      color: whiteHexColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


