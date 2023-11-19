import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_app/bloc/LoginBloc/login_bloc.dart';
import 'package:voice_app/bloc/RegisterBloc/register_bloc.dart';
import 'package:voice_app/bloc/VoiceBloc/voice_bloc.dart';
import 'package:voice_app/core/navigation/navigation_route.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';
import 'package:voice_app/firebase_options.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/repository/auth/repository_store.dart';
import 'package:voice_app/product/repository/voice_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<VoiceRepository>(
          create: (context) => VoiceRepository(),
        ),
        // RepositoryProvider<AuthRepository>(
        //   create: (context) => AuthRepository(service: AuthServices()),
        // ),
        RepositoryProvider<LoginBloc>(
            create: (context) =>
                LoginBloc(authRepo: RepositoryStore.authRepository)),
        RepositoryProvider<RegisterBloc>(
            create: (context) =>
                RegisterBloc(authRepo: RepositoryStore.authRepository))
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        // home: MyHomePage(),
        theme: ThemeData(
          scaffoldBackgroundColor: ColorConstants.appBackground,
          appBarTheme: const AppBarTheme(
            color: ColorConstants.transparent,
          ),
          useMaterial3: false,
          colorScheme: ColorScheme.fromSeed(
                  background: Colors.white,
                  seedColor: ColorConstants.colorsWhite)
              .copyWith(background: ColorConstants.appBackground),
        ),
        // home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text to Speech Conversion'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              maxLines: 10,
              onChanged: (value) {
                setState(() {
                  VoiceRepository.textToConvert = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Enter Text'),
            ),
            DropdownButton<String>(
              value: VoiceRepository.selectedVoice,
              onChanged: (String? newValue) {
                setState(() {
                  VoiceRepository.selectedVoice = newValue!;
                });
              },
              items: VoiceRepository.voiceOptions.map((String voice) {
                return DropdownMenuItem<String>(
                  value: voice,
                  child: Text(voice),
                );
              }).toList(),
            ),
            const ElevatedButton(
              onPressed: VoiceRepository.downloadFile,
              child: Text('Convert to Speech'),
            ),
          ],
        ),
      ),
    );
  }
}

class Deneme extends StatefulWidget {
  const Deneme({super.key});

  @override
  State<Deneme> createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => VoiceBloc(
        RepositoryProvider.of(context),
      )..add(LoadVoice()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Text to Speech Conversion'),
        ),
        body: BlocBuilder<VoiceBloc, VoiceState>(
          builder: (context, state) {
            debugPrint('state ${state.runtimeType}');
            if (state is VoiceInitial || state is VoiceLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is VoiceError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is VoiceLoaded) {
              // API'den gelen ses kimliklerini içerir

              return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<VoiceBloc>(context).add(LoadVoice());
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          maxLines: 10,
                          onChanged: (value) {
                            setState(() {
                              VoiceRepository.textToConvert = value;
                            });
                          },
                          decoration:
                              const InputDecoration(labelText: 'Enter Text'),
                        ),
                        DropdownButton<String>(
                          value: VoiceRepository.selectedVoice,
                          onChanged: (String? newValue) {
                            setState(() {
                              VoiceRepository.selectedVoice = newValue!;
                            });
                          },
                          items:
                              VoiceRepository.voiceOptions.map((String voice) {
                            return DropdownMenuItem<String>(
                              value: voice,
                              child: Text(voice),
                            );
                          }).toList(),
                        ),
                        const ElevatedButton(
                          onPressed: VoiceRepository.downloadFile,
                          child: Text('Convert to Speech'),
                        ),
                      ],
                    ),
                  ));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
