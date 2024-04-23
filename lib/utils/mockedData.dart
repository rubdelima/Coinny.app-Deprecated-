import 'package:learn/utils/modelsClass.dart';

Children luciano = Children(
    childrenCode: "1111",
    name: "Luciano Dias",
    birthdate: DateTime(2010, 11, 4),
    pontuation: 1200,
    photoPath: "assets/images/appImages/luciano.png",
    lastAccsess: DateTime(2024, 02, 28),
    acheivments: [
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 1),
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 2),
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 3)
    ],
    activities: [
      [0, 1],
      [],
    ],
    xpPerDay: {
      today.subtract(const Duration(days: 7)): 100,
      today.subtract(const Duration(days: 6)): 200,
      today.subtract(const Duration(days: 5)): 400,
      today.subtract(const Duration(days: 4)): 100,
      today.subtract(const Duration(days: 3)): 20,
      today.subtract(const Duration(days: 2)): 100,
      today.subtract(const Duration(days: 1)): 160,
      today.subtract(const Duration(days: 0)): 100,
    });

Children carlos = Children(
    childrenCode: "2222",
    name: "Carlos Dias",
    birthdate: DateTime(2012, 11, 4),
    pontuation: 1600,
    photoPath: "assets/images/appImages/carlos-dias.png",
    lastAccsess: DateTime(2024, 02, 28),
    acheivments: [
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 1),
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 2),
      AcheivmentsDate(date: DateTime(2024, 01, 12), id: 3)
    ],
    activities: [
      [],
      [],
    ],
    xpPerDay: {
      today.subtract(const Duration(days: 7)): 50,
      today.subtract(const Duration(days: 6)): 100,
      today.subtract(const Duration(days: 5)): 200,
      today.subtract(const Duration(days: 4)): 100,
      today.subtract(const Duration(days: 3)): 300,
      today.subtract(const Duration(days: 2)): 120,
      today.subtract(const Duration(days: 1)): 120,
      today.subtract(const Duration(days: 0)): 80,
    });


Parents joana = Parents(
    name: "Joana Dias",
    dependents: [luciano, carlos],
    photoPath: "assets/images/appImages/joana-dias.png");
