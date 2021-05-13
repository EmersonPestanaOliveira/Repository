import 'package:ludo_academy/model/database/Jogo.dart';
import 'package:ludo_academy/model/novaPartida/mesas/MesaJogo.dart';
import 'package:ludo_academy/model/room/AlunoPresenca.dart';

class PartidaHelper {
  static List<MesaJogo> doMesasRandom(List<AlunoPresenca> alunos, Jogo jogo) {
    double maxJ = jogo.jogMax.toDouble();
    double minJ = jogo.jogMin.toDouble();
    double tJ = alunos.length.toDouble();
    int tM = 0;
    double sJ = alunos.length.toDouble();

    print ("maxJ: " + maxJ.toString() + ", minJ: " + minJ.toString() + ", tJ: " + tJ.toString());

    List<MesaJogo> oMesas = new List<MesaJogo>();

    if (tJ >= minJ)
    {
      if (sJ % maxJ == 0) {
        tM = (sJ ~/ maxJ).toInt();

        for (int i = 0; i < tM; i++) {
          oMesas.add(new MesaJogo(i, maxJ.toInt()));
        }
      }
      else {
        while (sJ > 0)
        {
          double tempJ = 0;

          if (sJ - maxJ >= 0) {

            if (sJ - maxJ < minJ) {
              tempJ = (maxJ / 2).roundToDouble();
            }
            else {
              tempJ = maxJ;
            }

            sJ -= tempJ;

            tM++;
            oMesas.add(new MesaJogo(oMesas.length, tempJ.toInt()));

            continue;
          }
          else if (sJ - minJ >= 0)
          {
            if (sJ - minJ < minJ) {
              tempJ = sJ;
            }
            else {
              tempJ = minJ;
            }

            sJ -= tempJ;

            tM++;
            oMesas.add(new MesaJogo(oMesas.length, tempJ.toInt()));
            continue;
          }

        }
        if (sJ > 0) {
          oMesas.add(new MesaJogo(oMesas.length, sJ.toInt()));
        }
      }
    }
    else
    {
      tM = 1;
      oMesas.add(new MesaJogo(oMesas.length, sJ.toInt()));
    }

    return oMesas;
  }
}