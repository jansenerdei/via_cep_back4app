import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viacepapp/page/cep_page.dart';

class CepApp extends StatelessWidget {
  const CepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Via CEP app',
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(backgroundColor: Color.fromRGBO(3, 3, 139, 0.004)),
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        // fontFamily: GoogleFonts.lobster(),
        // colorScheme:
        //     ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 31, 5, 75)),
        useMaterial3: true,
      ),
      home: const CepPage(),
    );
  }
}
