import 'package:flutter/material.dart';
import 'package:news_app/api/AppConfigProvider.dart';
import 'package:news_app/home/widgets/SideMenu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  static const String routeName = 'Settings';
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  static String language = 'English';
  @override
  Widget build(BuildContext context) {
    final AppConfigProvider provider =Provider.of<AppConfigProvider>(context);
    return  Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).primaryColor,
    title: Text(AppLocalizations.of(context)!.settings),
    centerTitle: true,
    shape: ContinuousRectangleBorder(
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(80),
    bottomRight: Radius.circular(80))),
    ),
   drawer:SideMenu(),
     body:  Container(
       decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bg.png'),fit: BoxFit.fill)),
       alignment: Alignment.center,
       child: Column(
     children: [
       Padding(
         padding:  EdgeInsets.all(25.0),
         child: Text(AppLocalizations.of(context)!.language,
             style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.bold,
                 color: Color(0xFF39A552)),
             textAlign: TextAlign.start),
       ),
       Padding(
         padding: EdgeInsets.fromLTRB(45.0, 0, 45.0, 0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Container(
               padding: EdgeInsets.symmetric(horizontal: 10.0),
               decoration: BoxDecoration(
                 border: Border.all(
                     color: Color(0xFF39A552),
                     style: BorderStyle.solid,
                     width: 2),
               ),
               child: DropdownButton<String>(
                 value: language,
                 icon: Icon(Icons.arrow_drop_down),
                 iconEnabledColor: Color(0xFF39A552),
                 iconSize: 24,
                 isExpanded: true,
                 elevation: 16,
                 style: TextStyle(
                     color: Color(0xFF39A552)),
                 onChanged: (String? newValue) {
                   setState(() {
                     language = newValue!;
                     if(newValue=='English')
                       provider.changeLanguage('en');
                     else if (newValue=='Arabic'){
                       provider.changeLanguage('ar');
                     }
                   });
                 },
                 items: <String>['English', 'Arabic']
                     .map<DropdownMenuItem<String>>((String value) {
                   return DropdownMenuItem<String>(
                     value: value,
                     child: Text(value),
                   );
                 }).toList(),
               ),
             ),
           ],
         ),
       ),
     ],
     crossAxisAlignment: CrossAxisAlignment.stretch,
       ),
     ),
    );
  }
}

