import "package:envied/envied.dart";

part 'api.g.dart';

//  dart run build_runner build -d
@Envied(path: '.env')
abstract class Api {
  //  Url
  @EnviedField(varName: 'SUPABASE_URL', defaultValue: '')
  static const String url = _Api.url;

  //  Anon Key
  @EnviedField(varName: 'SUPABASE_ANON_KEY', defaultValue: '')
  static const String anonKey = _Api.anonKey;
}
