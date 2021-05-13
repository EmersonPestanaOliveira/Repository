import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/repository/acesso/AcessoRepository.dart';
import 'package:ludo_academy/controller/repository/game/GameRepository.dart';
import 'package:ludo_academy/controller/repository/home/alunos/AlunosRepository.dart';
import 'package:ludo_academy/controller/repository/home/alunos/TurmaRepository.dart';
import 'package:ludo_academy/controller/repository/home/blog/BlogRepository.dart';
import 'package:ludo_academy/controller/repository/home/changeschool/ChangeSchoolRepository.dart';
import 'package:ludo_academy/controller/repository/home/historico/HistoricoRepository.dart';
import 'package:ludo_academy/controller/repository/home/jogos/JogosRepository.dart';
import 'package:ludo_academy/controller/repository/inteligencia/InteligenciaRepository.dart';
import 'package:ludo_academy/controller/repository/novaPartida/NovaPartidaRepository.dart';
import 'package:ludo_academy/controller/repository/novaPartida/alunosMesas/AlunosMesasRepository.dart';
import 'package:ludo_academy/controller/repository/novaPartida/confirmacao/ConfirmacaoRepository.dart';
import 'package:ludo_academy/controller/repository/novaPartida/mesas/MesasRepository.dart';
import 'package:ludo_academy/controller/repository/novaPartida/presenca/PresencaRepository.dart';
import 'package:ludo_academy/controller/repository/usuario/DetalhesRepository.dart';
import 'package:ludo_academy/controller/repository/usuario/UsuarioRepository.dart';
import 'package:ludo_academy/controller/repository/partida/DetailsPartidaRepository.dart';
import 'package:ludo_academy/controller/repository/partida/DetailsMesaRepository.dart';
import 'package:ludo_academy/model/database/Acesso.dart';
import 'package:ludo_academy/model/login/LoginData.dart';
import 'package:ludo_academy/view/components/game/GameComponent.dart';
import 'package:ludo_academy/view/components/home/HomeComponent.dart';
import 'package:ludo_academy/view/components/novaPartida/NovaPartidaComponent.dart';
import 'package:ludo_academy/view/components/partida/DetailsPartidaComponent.dart';
import 'package:ludo_academy/view/widgets/mesa/DetailsMesaPage.dart';
import 'package:ludo_academy/view/widgets/novaPartida/confirmacao/ConfirmacaoForm.dart';


class Application {
  // System vars
  static Router oRouter;
  static int iAppMode;
  static LoginData oLoginData;
  static Acesso oProfile;

  // Server Info
  //static String sUrlApi = "http://192.168.15.13:8080/ludo_api/public/";
  static String sUrlApi = "https://ludo.academy/api/public/";
  //static String sUrlApi = "http://elevendragons.com/ludo/ludo_api/public/";
  //static String sUrlBlogApi = "http://ludo.academy/wp-json/wp/v2/posts?_embed";
  //static String sUrlBlogBase = "http://ludo.academy/";
  static String sUrlBlogBase = "http://192.168.0.178/jamboeditora/";
  static String sUrlBlogApi = "wp-json/wp/v2/posts?_embed";

  // Credenciais API Ludo
  static String sUsername = 'admin';
  static String sPassword = 'YWRtaW4=';
  static String sBasicAuth = 'Basic ' + base64Encode(utf8.encode('$sUsername:$sPassword'));

  // Transition vars
  static TransitionType sDefaultInTransition = TransitionType.inFromRight;
  static TransitionType sDefaultOutTransition = TransitionType.inFromLeft;

  // Keys
  static final kTab = new GlobalKey<NovaPartidaStateComponent>();
  static final kHome = new GlobalKey<HomeComponentState>();
  static final kDetailsPartida = new GlobalKey<DetailsPartidaStateComponent>();
  static final kConfirmacao = new GlobalKey<ConfirmacaoFormState>();
  static final kDetailsMesa = new GlobalKey<DetailsMesaPageState>();
  static final kDetailsGame = new GlobalKey<GameComponentState>();

  // Repository
  static AcessoRepository oRepositoryAcesso = new AcessoRepository();
  static HistoricoRepository oRepositoryHistorico = new HistoricoRepository();
  static AlunosRepository oRepositoryAlunos = new AlunosRepository();
  static BlogRepository oRepositoryBlog = new BlogRepository();
  static JogosRepository oRepositoryJogos = new JogosRepository();
  static TurmaRepository oRepositoryTurma = new TurmaRepository();
  static UsuarioRepository oRepositoryUsuario = new UsuarioRepository();
  static DetalhesRepository oRepositoryDetalhes = new DetalhesRepository();
  static InteligenciaRepository oRepositoryInteligencia = new InteligenciaRepository();
  static GameRepository oRepositoryGame = new GameRepository();
  static ChangeSchoolRepository oRepositoryChangeSchool = new ChangeSchoolRepository();

    // Nova Partida
  static NovaPartidaRepository oRepositoryNovaPartida = new NovaPartidaRepository();
  static PresencaRepository oRepositoryPresenca = new PresencaRepository();
  static AlunosMesasRepository oRepositoryAlunosMesas = new AlunosMesasRepository();
  static MesasRepository oRepositoryMesas = new MesasRepository();
  static ConfirmacaoRepository oRepositoryConfirmacao = ConfirmacaoRepository();

  // Change School

  // Partida
  static DetailsMesaRepository oRepositoryDetailsMesa = new DetailsMesaRepository();
  static DetailsPartidaRepository oRepositoryDetailsPartida = new DetailsPartidaRepository();

  // Hacks
  static List<String> lAlphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Z'];
  static List<int> lPartidas = new List<int>();
  static List<String> lPerfil1 = ["Lógica", "Lógica", "Lógica", "Lógica", "Lógica", "Lógica", "Lógica", "Lógica"];
  static List<String> lPerfil2 = ["Analisar", "Analisar", "Analisar", "Analisar", "Analisar", "Analisar", "Analisar", "Analisar"];
}
