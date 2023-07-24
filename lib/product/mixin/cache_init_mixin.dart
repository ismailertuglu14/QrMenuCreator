import '../../core/init/cache/local_storage.dart';

mixin CacheInit {
  Future<void> cacheInit() async {
    await Future.wait([
      LocaleStorage.preferencesInit(),
      
    ]);
  }
}
