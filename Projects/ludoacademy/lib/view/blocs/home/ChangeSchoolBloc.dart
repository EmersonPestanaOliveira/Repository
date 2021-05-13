import 'dart:async';

import 'package:ludo_academy/controller/repository/home/changeschool/ChangeSchoolRepository.dart';
import 'package:ludo_academy/model/database/Escola.dart';
import 'package:ludo_academy/model/home/changeschool/ChangeSchoolEvent.dart';
import 'package:ludo_academy/model/home/changeschool/ChangeSchoolState.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class ChangeSchoolBloc extends Bloc<ChangeSchoolEvent, ChangeSchoolState> {
  final ChangeSchoolRepository oChangeSchoolRepository;

  ChangeSchoolBloc({
    @required this.oChangeSchoolRepository
  })  : assert(ChangeSchoolRepository != null);

  ChangeSchoolState get initialState => ChangeSchoolUninitialized();

  @override
  Stream<ChangeSchoolState> mapEventToState(ChangeSchoolEvent event) async* {
    yield ChangeSchoolLoading();

    if (event is ChangeSchoolLoad) {
      try {
        ServerResponse r = await oChangeSchoolRepository.escolaLoader(usuarioId: event.id);
        List<Escola> oEscolas = new List<Escola>();

        if (r.data != null && r.data.length > 0) {
          r.data.forEach((item) {
            Escola e = new Escola.fromJson(item);
            oEscolas.add(e);
          });
        }

        if (oEscolas.length > 0) {
          yield ChangeSchoolInitialized(oEscolas: oEscolas);
        }
        else {
          yield ChangeSchoolEmpty();
        }
      }
      catch(error) {
        yield ChangeSchoolError(sError: error);
      }
    }
  }
}