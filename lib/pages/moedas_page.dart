import 'package:crypto_moedas/pages/moedas_detalhes_page.dart';
import 'package:crypto_moedas/repository/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/moeda.dart';
  class MoedasPage extends StatefulWidget {
    const MoedasPage({Key? key}) : super(key: key);

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {

  mostrarDetalhes(Moeda moeda){
    Navigator.push(context, MaterialPageRoute(
        builder: (_) => MoedasDetalhesPage(moeda: moeda)
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabela = MoedaRepository.tabela;
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    List<Moeda> selecionadas = [];

    return Scaffold(
       appBar: AppBar(
           title: Text('Cripto Moedas'),
       ),
       body: ListView.separated(
           itemBuilder: (BuildContext context, int moeda){
               return ListTile(
                 shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                 ),
                    leading: SizedBox(
                      child: Image.asset(tabela[moeda].icone),
                      width: 40,

                  ),
                  title: Text(tabela[moeda].nome , style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500
                  ),),
                  trailing: Text(real.format(tabela[moeda].preco)),
                  selected: selecionadas.contains(tabela[moeda]),
                  selectedTileColor: Colors.pink[50],
                  onLongPress:  (){

                     setState(() {
                       (selecionadas.contains(tabela[moeda]))
                           ? selecionadas.remove(tabela[moeda])
                           : selecionadas.add(tabela[moeda]);
                     });

                  },
                    onTap: () => mostrarDetalhes(tabela[moeda]),
                );
            },
           padding: EdgeInsets.all(16),
           separatorBuilder: (_, __) => Divider(),
           itemCount: tabela.length)
    );
  }
}
