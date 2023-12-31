import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Application extends StatefulWidget {
  const Application({
    Key? key,
  }) : super(key: key);
  static const String routeName = 'Application';

  @override
  State<Application> createState() => _Application();
}

class _Application extends State<Application> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithoutJavaScript(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithoutDomStorage(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    // onPressed calls using this URL are not gated on a 'canLaunch' check
    // because the assumption is that every device can launch a web URL.
    final Uri toLaunch =
        Uri(scheme: 'https', host: 'fill.io', path: 'ONLINE-APPLICATION');
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                    onChanged: (String text) => _phone = text,
                    decoration: const InputDecoration(
                        hintText: 'Input the phone number to launch')),
              ),
              ElevatedButton(
                onPressed: _hasCallSupport
                    ? () => setState(() {
                          _launched = _makePhoneCall(_phone);
                        })
                    : null,
                child: _hasCallSupport
                    ? const Text('Make phone call')
                    : const Text('Calling not supported'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(toLaunch.toString()),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch);
                }),
                child: const Text('Launch in browser'),
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInWebViewOrVC(toLaunch);
                }),
                child: const Text('Launch in app'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInWebViewWithoutJavaScript(toLaunch);
                }),
                child: const Text('Launch in app (JavaScript OFF)'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInWebViewWithoutDomStorage(toLaunch);
                }),
                child: const Text('Launch in app (DOM storage OFF)'),
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchUniversalLinkIos(toLaunch);
                }),
                child: const Text(
                    'Launch a universal link in a native app, fallback to Safari.(Youtube)'),
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInWebViewOrVC(toLaunch);
                  Timer(const Duration(seconds: 5), () {
                    print('Closing WebView after 5 seconds...');
                    closeInAppWebView();
                  });
                }),
                child: const Text('Launch in app + close after 5 seconds'),
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              Link(
                uri: Uri.parse('https://chai.ml/'),
                target: LinkTarget.blank,
                builder: (BuildContext ctx, FollowLink? openLink) {
                  return TextButton.icon(
                    onPressed: openLink,
                    label: const Text('Link Widget documentation'),
                    icon: const Icon(Icons.read_more),
                  );
                },
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              FutureBuilder<void>(future: _launched, builder: _launchStatus),
            ],
          ),
        ],
      ),
    );
  }
}
