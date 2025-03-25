import 'package:flutter/material.dart';
import 'package:technical_flutter_exam/core/util/app_theme.dart';
import 'package:technical_flutter_exam/features/domain/model/company_model.dart';
import 'package:technical_flutter_exam/features/ui/components/app_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final CompanyModel data;

  const WebViewScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.determineThemeByName(data.name);

    final controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(data.webUrl));

    return AppScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black45,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: theme.primary,
        title: Text(
          data.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
