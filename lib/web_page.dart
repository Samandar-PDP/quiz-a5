import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late WebViewController _webViewController;

  bool _isLoading = true;
  bool _isSearch = false;
  final _search = TextEditingController();

  @override
  void initState() {
    _webViewController = WebViewController();
    _webViewController.setNavigationDelegate(NavigationDelegate(
      onPageFinished: (v) {
        _isLoading = false;
        setState(() {

        });
       //print("on finished $v");
      },
      onProgress: (v) {
        print("on progress worked");
      }
    ));
    _webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    _webViewController.loadRequest(Uri.parse("https://kun.uz"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearch ? TextField(
          controller: _search,
          textInputAction: TextInputAction.search,
          onSubmitted: (v) {
            _webViewController.loadRequest(Uri.parse("https://$v"));
            setState(() {});
          },
        ) : const Text("Web View"),
        actions: [
          IconButton(onPressed: () {
            _isSearch = !_isSearch;
            setState(() {

            });
          }, icon: Icon(_isSearch ? Icons.close : Icons.search))
        ],
      ),
      body: _isLoading ? const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
          strokeWidth: 6,
        ),
      ) : WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}
