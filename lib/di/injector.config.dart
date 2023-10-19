// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/repository/impl/user_repository_impl.dart' as _i11;
import '../core/data/repository/interface/user_repository.dart' as _i10;
import '../core/domain/use_case/impl/user_case_impl.dart' as _i9;
import '../core/domain/use_case/intreface/user_case.dart' as _i8;
import '../core/store/user_store.dart' as _i12;
import '../screens/auth_screen/data/repository/impl/auth_repository_impl.dart'
    as _i6;
import '../screens/auth_screen/data/repository/interface/auth_repository.dart'
    as _i5;
import '../screens/auth_screen/domain/use_case/impl/auth_case_impl.dart' as _i4;
import '../screens/auth_screen/domain/use_case/interface/auth_case.dart' as _i3;
import '../screens/auth_screen/presentation/store/auth_store.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthCase>(() => _i4.AuthCaseImpl());
    gh.factory<_i5.AuthRepository>(() => _i6.AuthRepositoryImpl());
    gh.factory<_i7.AuthStore>(
        () => _i7.AuthStore(authCase: gh<_i3.AuthCase>()));
    gh.factory<_i8.UserCase>(() => _i9.UserCaseImpl());
    gh.factory<_i10.UserRepository>(() => _i11.UserRepositoryImpl());
    gh.singleton<_i12.UserStore>(_i12.UserStore(userCase: gh<_i8.UserCase>()));
    return this;
  }
}
