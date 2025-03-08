import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namer_app/presentation/pages/camera/camera_page.dart';
import 'package:namer_app/presentation/pages/home/setting/general_setting_tab.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.orange,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.orange,
                child: TabBar(
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    Tab(text: "General"),
                    Tab(text: "Account"),
                    Tab(text: "Privacy"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: GeneralSettingTab()),
                    Center(child: CameraPage()),
                    Center(child: Text("Privacy Settings")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
