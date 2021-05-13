import 'package:ludo_academy/model/database/Jogo.dart';
import 'package:ludo_academy/model/novaPartida/mesas/MesaJogo.dart';
import 'package:ludo_academy/model/room/AlunoPresenca.dart';

class NovaPartida {
  int iTurma = 0;
  String sNomeTurma = "";
  List<AlunoPresenca> lAlunos = new List<AlunoPresenca>();
  Jogo oJogo;
  List<MesaJogo> lMesas = new List<MesaJogo>();
  bool _bMesasArranged = false;

  // ignore: unnecessary_getters_setters
  bool get bMesasArranged => _bMesasArranged;

  // ignore: unnecessary_getters_setters
  set bMesasArranged(bool bMesasArranged) {
    _bMesasArranged = bMesasArranged;
  }

  void setTurma(int value, String name) {
    iTurma = value;
    sNomeTurma = name;
  }

  void setJogo(Jogo value) {
    oJogo = value;
  }

  void addAluno(AlunoPresenca value) {

    bool bAchou = false;

    lAlunos.forEach((aluno) {
      if (aluno.id == value.id) {
        bAchou = true;
      }
    });

    //if (!lAlunos.contains(value)) {
    if (!bAchou) {
      lAlunos.add(value);
    }

  }

  void removeAluno(AlunoPresenca value) {
    value.bMesa = false;
    lAlunos.remove(value);
  }

  void clearAlunos() {
    lAlunos.clear();
  }

  void addMesa() {
    int id = 0;

    if (lMesas.length > 0) {
      lMesas.forEach((mesa) {
        if (mesa.nId > id) id = mesa.nId;
      });

      lMesas.add(new MesaJogo(id+1, 1));
    }
    else {
      lMesas.add(new MesaJogo(id, 1));
    }
  }

  void removeMesa(MesaJogo value) {

    lAlunos.forEach((aluno) {
      if (aluno.nMesaId == value.nId) {
        aluno.bMesa = false;
        aluno.nMesaId = -1;
      }
    });

    lMesas.remove(value);
  }

  void clearMesas() {
    lMesas.clear();
  }

  void addAlunoToMesa(int aluno, int mesaId) {
    lAlunos.forEach((item) {
      if (item.id == aluno) {
        item.nMesaId = mesaId;
        item.bMesa = true;
      }
    });
  }

  void removeAlunoFromMesa(int aluno, int mesaId) {
    lAlunos.forEach((item) {
      if (item.id == aluno) {
        item.nMesaId = -1;
        item.bMesa = false;
      }
    });
  }

  int getAlunoCount(int mesaId) {
    int count = 0;

    lAlunos.forEach((item) {
      if (item.nMesaId == mesaId) {
        count++;
      }
    });

    return count;
  }

  bool checkMesas() {

    bool bAlunos = false;
    lAlunos.forEach((aluno) {
      if (!aluno.bMesa) {
        bAlunos = true;
      }
    });

    if (bAlunos) return false;

    for (int i = 0; i < lMesas.length; i++) {
      int count = 0;

      lAlunos.forEach((aluno) {
        if (lMesas[i].nId == aluno.nMesaId && aluno.bMesa) {
          count++;
        }
      });

      if (count < oJogo.jogMin) {
        return false;
      }
    }

    return true;
  }
}