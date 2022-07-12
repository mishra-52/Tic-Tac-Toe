import 'package:flutter/material.dart';
import 'package:tic_tac_toe/gamebutton.dart';
import 'custom_dialog.dart';
//import 'package:tic_tac_toe/dialog.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <GameButton> buttonslist;
  var player1;
  var player2;
  var activeplayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonslist = doInit();
    player1 = List();
    player2 = List();
    activeplayer = 2;
  }

  List<GameButton> doInit(){
    var gameButtons = <GameButton>[

      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),

    ];
    return gameButtons;
  }

  void playGame(GameButton gb){
    setState(() {
      if(activeplayer==1){
        gb.text = "X";
        gb.bg = Colors.lightGreenAccent;
        activeplayer = 2;
        player1.add(gb.id);
      } else{
        gb.text = "O";
        gb.bg = Colors.yellowAccent;
        activeplayer = 1;
        player2.add(gb.id);
      }
      gb.enabled=false;
      checkWinner();
    });
  }

  void checkWinner(){
    var winner = -1;
    if(player1.contains(1)&&player1.contains(2)&&player1.contains(3)){
      winner=1;
    }
    if(player1.contains(4)&&player1.contains(5)&&player1.contains(6)){
      winner=1;
    }
    if(player1.contains(7)&&player1.contains(8)&&player1.contains(9)){
      winner=1;
    }
    if(player1.contains(1)&&player1.contains(5)&&player1.contains(9)){
      winner=1;
    }
    if(player1.contains(3)&&player1.contains(5)&&player1.contains(7)){
      winner=1;
    }
    if(player1.contains(1)&&player1.contains(4)&&player1.contains(7)){
      winner=1;
    }
    if(player1.contains(2)&&player1.contains(5)&&player1.contains(8)){
      winner=1;
    }
    if(player1.contains(3)&&player1.contains(6)&&player1.contains(9)){
      winner=1;
    }
    if(player2.contains(1)&&player2.contains(2)&&player2.contains(3)){
      winner=2;
    }
    if(player2.contains(4)&&player2.contains(5)&&player2.contains(6)){
      winner=2;
    }
    if(player2.contains(7)&&player2.contains(8)&&player2.contains(9)){
      winner=2;
    }
    if(player2.contains(1)&&player2.contains(5)&&player2.contains(9)){
      winner=2;
    }
    if(player2.contains(3)&&player2.contains(5)&&player2.contains(7)){
      winner=2;
    }
    if(player2.contains(1)&&player2.contains(4)&&player2.contains(7)){
      winner=2;
    }
    if(player2.contains(2)&&player2.contains(5)&&player2.contains(8)){
      winner=2;
    }
    if(player2.contains(3)&&player2.contains(6)&&player2.contains(9)){
      winner=2;
    }

    if(winner!=-1){
      if(winner==1){
        showDialog(
          context: context,
          builder: (_)=> CustomDialog("Player 1(X) Won","Click Reset to restart the game",resetgame));
        winner=-1;
      } else if(winner==2){
        showDialog(
            context: context,
            builder: (_)=> CustomDialog("Player 2(O) Won","Click Reset to restart the game",resetgame));
        winner=-1;
      }
      player1.clear();
      player2.clear();
    }
  }
  void resetgame(){
    if(Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonslist = doInit();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appbar******************************************************************
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),

      //body********************************************************************
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(50.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 9.0,
                  mainAxisSpacing: 9.0,
                ),
                itemCount: buttonslist.length,
                itemBuilder: (context,i)=>SizedBox(
                  width: 70.0,
                  height: 70.0,
                  child: RaisedButton(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      buttonslist[i].text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0),),
                    onPressed: buttonslist[i].enabled?()=>playGame(buttonslist[i]):null,
                    color: buttonslist[i].bg,
                    disabledColor: buttonslist[i].bg,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 100.0,
            ),
          ],

        ),
      ),
  floatingActionButton: FloatingActionButton(
    onPressed: resetgame,
    backgroundColor: Colors.deepOrange,
    foregroundColor: Colors.white,
    child: Icon(Icons.refresh),
  ),
    );
  }
}
