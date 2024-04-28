import 'package:learn/classes.dart';

const constLession = Lesson(
  id: 99,
  title: "Questão Deafult",
  description:
      "Essa Licão ainda não foi feita, aguarde",
);

const  Map<int, Lesson> lessionsList = {
  0: Lesson(
    id: 0,
    title: "Montando o orçamento para o passeio",
    description:
        "Antes de ir para o passeio, precisamos nos planejar com o dinheiro disponível que temos, esse é o primeiro passo para um passeio de qualidade!",
    pageRouter: "/lession01"
  ),
  1: Lesson(
    id: 1,
    title: "Passeando no Shopping antes do cinema!",
    description:
        "Estar no Shopping e não passear com os amigos antes do Cinema é o mesmo que não ter ido no Shopping né? Mas é preciso ter muito cuidado com os gastos!",
  ),
  2: Lesson(
    id: 2,
    title: "Passeando no Shopping antes do cinema!",
    description:
        "Estar no Shopping e não passear com os amigos antes do Cinema é o mesmo que não ter ido no Shopping né? Mas é preciso ter muito cuidado com os gastos!",
  ),
};