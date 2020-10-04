import 'package:device_id/device_id.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hive/hive.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';

import '../bloc/todo.dart';
import '../style.dart';
import '../widgets/carousel.dart';
import '../widgets/timer.dart';
import 'main_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void oneSignalSetup() async {
    //Remove this method to stop OneSignal Debugging
    // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.init("db0ea659-1a25-47e5-808a-88526dbb9e22");
    if (Hive.box("episode").get("oneSignaled") != "true") {
      var deviceId = await DeviceId.getID;
      OneSignal.shared.setExternalUserId(deviceId);
      Hive.box("episode").put("oneSignaled", "true");
    }
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
  }

  @override
  void initState() {
    oneSignalSetup();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: const MainDrawer(),
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: NeumorphicAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: Style.doublePadding),
              child: MainTimer(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(Style.doublePadding,
                  Style.mainPadding, Style.mainPadding, 0.0),
              child: Selector<Todo, int>(
                  selector: (_, todo) => todo.total_items,
                  shouldRebuild: (old_total, new_total) =>
                      old_total != new_total,
                  builder: (_, total_items, __) {
                    return Text(
                      'task_count',
                      style: TextStyle(
                          color: NeumorphicTheme.defaultTextColor(context)
                              .withOpacity(0.5),
                          fontSize: 16.00),
                    ).plural(total_items);
                  }),
            ),
            const Carousel(),
            const SizedBox(height: Style.doublePadding)
          ],
        ),
      ),
    );
  }
}
