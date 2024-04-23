
import 'package:flutter/material.dart';

const Map<int, Map<String, dynamic>> levelsPontuations = {
  0     : {'level' : 'Bronze',   'class' : 'I'  , 'nextLevelValue' : 200 ,  'levelValue': 0    },
  200   : {'level' : 'Bronze',   'class' : 'II' , 'nextLevelValue' : 500,   'levelValue': 200  },
  500   : {'level' : 'Bronze',   'class' : 'III', 'nextLevelValue' : 1000,  'levelValue': 500  },
  1000  : {'level' : 'Prata' ,   'class' : 'I'  , 'nextLevelValue' : 2000,  'levelValue': 1000 },
  2000  : {'level' : 'Prata' ,   'class' : 'II' , 'nextLevelValue' : 4000,  'levelValue': 2000 },
  4000  : {'level' : 'Prata' ,   'class' : 'III', 'nextLevelValue' : 6000,  'levelValue': 4000 },
  6000  : {'level' : 'Ouro'  ,   'class' : 'I'  , 'nextLevelValue' : 8000,  'levelValue': 6000 },
  8000  : {'level' : 'Ouro'  ,   'class' : 'II' , 'nextLevelValue' : 10000, 'levelValue': 8000 },
  10000 : {'level' : 'Ouro'  ,   'class' : 'III', 'nextLevelValue' : 12000, 'levelValue': 10000},
  12000 : {'level' : 'Diamante', 'class' : 'I'  , 'nextLevelValue' : 14000, 'levelValue': 12000},
  14000 : {'level' : 'Diamante', 'class' : 'II' , 'nextLevelValue' : 16000, 'levelValue': 14000},
  16000 : {'level' : 'Diamante', 'class' : 'III', 'nextLevelValue' : 16001, 'levelValue': 16000}
};

const  Map<String, List<Color>> boxesCollors = {
  'Bronze' : [Color(0xFF75250C), Color(0xFFE3834F),  ],
  'Prata'  : [Color(0xFF4C4C4C), Color(0xFFB0B0B0), ],
  'Ouro'   : [Color(0xFFAF500B), Color(0xFFE6BB4B), ],
  "Diamante" : [Color(0xFF4B9CE6) , Color(0xFF0E0C82)]
};

const Map<String, Color> levelColors = {
  'Bronze':  Color(0xFFFFFFFF),
  'Prata' :  Color(0xFFFFFFFF),
  'Ouro'  :  Color(0xFFFFFFFF),
  "Diamante" :  Color(0xFFFFFFFF)
};