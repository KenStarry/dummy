import "package:envied/envied.dart";

part 'api.g.dart';

//  dart run build_runner build -d
@Envied(path: '.env')
final class Api {
  // //  Url
  // @EnviedField(varName: 'SUPABASE_URL')
  // static const String url = _Api.url;
  //
  // //  Anon Key
  // @EnviedField(varName: 'SUPABASE_ANON_KEY')
  // static const String anonKey = _Api.anonKey;
}
