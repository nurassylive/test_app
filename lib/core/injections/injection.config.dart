// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:test_app/core/injections/register_module.dart' as _i7;
import 'package:test_app/core/services/secure_storage.dart' as _i4;
import 'package:test_app/core/services/toast_dialog.dart' as _i5;
import 'package:test_app/features/login/services/providers/login_db_provider.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.FlutterSecureStorage>(registerModule.flutterSecureStorage);
    await gh.singletonAsync<_i4.SecureStorage>(
      () => _i4.SecureStorageImpl.init(gh<_i3.FlutterSecureStorage>()),
      preResolve: true,
    );
    gh.lazySingleton<_i5.ToastDialog>(() => _i5.ToastDialogImpl());
    gh.lazySingleton<_i6.LoginDBProvider>(
        () => _i6.LoginDBProviderImpl(secureStorage: gh<_i4.SecureStorage>()));
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
