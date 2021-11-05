import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ownfactory_flutter/di/di_container.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void initDi(String env) => $initGetIt(
      getIt,
      environmentFilter: NoEnvOrContains(env),
    );
