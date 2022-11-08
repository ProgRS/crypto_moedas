import 'package:crypto_moedas/pages/moedas_page.dart';
import 'package:flutter/material.dart';

import 'favoritas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina){
        setState(() {
              paginaAtual= pagina;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
              MoedasPage(),
              FavoritasPage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todas'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Todas'),

        ],
        onTap: (pagina){
              pc.animateToPage(pagina, duration: Duration(milliseconds: 400), curve: Curves.ease);
        },
        backgroundColor: Colors.pink[100],
      ),
    );
  }
}
