import 'package:flutter_template/app/app.dart';
import 'package:flutter_template/bootstrap.dart';
import 'package:flutter_template/core/ssl_certificate_override.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/flavor/flavor.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await dotenv.load();
  final devConfig = EnvConfig(
    // appName: 'KStrings.appname',
    appName: 'Compass',
    shouldCollectCrashLog: true,
    baseUrl: dotenv.env['BASEURL_DEVELOPMENT']!,
    hiveBoxName: dotenv.env['HIVE_DEVELOPMENT']!,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );
  bootstrap(() => App());
}
