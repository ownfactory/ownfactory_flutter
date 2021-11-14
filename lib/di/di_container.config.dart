// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config/env/dev_env.dart' as _i4;
import '../config/env/env.dart' as _i3;
import '../features/app/screens/interactor/init_interactor.dart' as _i7;
import '../features/appwrite/appwrite_storage.dart' as _i5;
import '../features/auth/auth_interactor.dart' as _i6;

const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get, {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.Env>(_i3.Env(), registerFor: {_prod});
  gh.singleton<_i3.Env>(_i4.DevEnv(), registerFor: {_dev});
  gh.singleton<_i5.AppwriteStorage>(_i5.AppwriteStorage(get<_i3.Env>()));
  gh.factory<_i6.AuthInteractor>(() => _i6.AuthInteractor(get<_i5.AppwriteStorage>()));
  gh.singleton<_i7.InitInteractor>(_i7.InitInteractor(get<_i5.AppwriteStorage>()));
  return get;
}
