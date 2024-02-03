import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'locale_string/locale_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      ///--------------------------------add 2 line below for language change-------------------------------->
      ///------------default language is english use here------------------------->
      translations: LocaleString(),
      locale: Locale("en", "US"),

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}



class HomePage extends StatelessWidget {
   HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("title".tr),),
      body: Column(
        children: [

          ///----------------use like this way for language change whole page and while aplication----------------------------------->
          Text("hello".tr,style: TextStyle(fontSize: 18,),),
          Text("message".tr,style: TextStyle(fontSize: 18,),),
          Text("story".tr),


          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            // var locale = Locale("hi","IN");

            ///-------------------------build Dialog is widgets of show dialog--------------------------->
            buildDialog(context);
          }, child: Text("change Language"))
        ],
      ),
    );
  }




  ///------------------this is list of language and locale---------------->
   ///-----------------this list is for shown on show dialog and language change from there--------------->
   final List locale = [
     {"name": "English", "locale" : Locale("en", "US")},
     {"name": "বাংলা", "locale" : Locale("bn", "BN")}
   ];



   ///-----------------this is getx controller file------------------>
   ///-------------change language from this method
   updateLanguage(Locale locale){
     Get.back();
     Get.updateLocale(locale);
   }



   ///------------------------this is a show dialog of all language and change select from here------------------------------>
   buildDialog(BuildContext context){
     showDialog(context: context, builder: (context) {
       return AlertDialog(
         title: Text("Choose Languague"),
         content: Container(
           width: 50,
           child: ListView.builder(
             shrinkWrap: true,
             itemCount: locale.length,
             itemBuilder: (context, index) {
               var localeLanguage = locale[index];
               return GestureDetector(
                   onTap: (){
                     ///----------------switch language by this line---------------->
                     updateLanguage(localeLanguage["locale"]);
                     ///----------------just for check language----------------->
                     print("language is : -----------------> ${localeLanguage["name"]}");
                   },
                   child: Column(
                     children: [
                       Text(localeLanguage["name"]),
                       Divider(),
                     ],
                   ));
             },
           ),
         ),
       );
     },);
   }

}
