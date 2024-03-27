import 'dart:io' show Platform;
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

Future<void> main() async {
  Map<String, String> envVars = Platform.environment;
  
  final twitter = v2.TwitterApi(
    bearerToken: envVars['BEARER_TOKEN']!,
    oauthTokens: v2.OAuthTokens(
      consumerKey: envVars['CONSUMER_KEY']!,
      consumerSecret: envVars['CONSUMER_SECRET']!,
      accessToken: envVars['ACCESS_TOKEN']!,
      accessTokenSecret: envVars['ACCESS_SECRET']!,
    ),
  );

  await twitter.tweets.createTweet(
    text: envVars['MESSAGE']!,
  );
}
