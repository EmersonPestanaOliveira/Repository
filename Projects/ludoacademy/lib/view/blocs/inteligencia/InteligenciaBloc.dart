import 'dart:async';

import 'package:ludo_academy/controller/repository/inteligencia/InteligenciaRepository.dart';
import 'package:ludo_academy/model/inteligencia/InteligenciaEvent.dart';
import 'package:ludo_academy/model/inteligencia/InteligenciaState.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:ludo_academy/model/user/DadosCompetencia.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class InteligenciaBloc extends Bloc<InteligenciaEvent, InteligenciaState> {
  final InteligenciaRepository oInteligenciaRepository;
  final int nUserId;

  InteligenciaBloc({
    @required this.oInteligenciaRepository,
    @required this.nUserId
  })  : assert(InteligenciaRepository != null);

  InteligenciaState get initialState => InteligenciaUninitialized();

  List<DadosCompetencia> _oInteligencias;

  // ignore: unnecessary_getters_setters
  List<DadosCompetencia> get oInteligencias => _oInteligencias;
  // ignore: unnecessary_getters_setters
  set oInteligencias(List<DadosCompetencia> oInteligencias) {
    _oInteligencias = oInteligencias;
  }

  @override
  Stream<InteligenciaState> mapEventToState(InteligenciaEvent event) async* {
    if (event is InteligenciaLoad) {
      yield InteligenciaLoading();

      try {
        ServerResponse r = await oInteligenciaRepository.inteligenciaLoader(userId: nUserId);

        oInteligencias = new List<DadosCompetencia>();

        if (r.data != null) {
          r.data.forEach((item) {

            if (!oInteligencias.contains(DadosCompetencia.fromJson(item))) {
              oInteligencias.add(DadosCompetencia.fromJson(item));
            }

          });
        }

        print (oInteligencias);

        yield InteligenciaInitialized(oInteligencias: oInteligencias);
      }
      catch(error) {
        yield InteligenciaError(sError: error.toString());
      }
    }
  }
}