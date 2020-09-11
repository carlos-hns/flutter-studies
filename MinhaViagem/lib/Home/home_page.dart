import 'package:flutter/material.dart';

import 'package:MinhaViagem/Cadastro/cadastro_page.dart';
import 'package:MinhaViagem/List/list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    
  final PageController _page$ = PageController(initialPage: 0);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page$,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          CadastroPage(),
          ListPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        
        currentIndex: selectedIndex,
        onTap: (index){
          this._page$.jumpToPage(index);
          setState(() {
            this.selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Cadastro"),
            icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
          ),
          BottomNavigationBarItem(
            title: Text("Listagem"),
            icon: Icon(
                Icons.calendar_view_day,
                size: 20.0,
                color: Colors.white,
              ),
          ),
        ],
      ),
    );
  }
}