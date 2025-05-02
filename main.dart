import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
              child: Text("START", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              shape: CircleBorder(),
              color: Colors.white,
              

              
              height:150,
              minWidth: 150,
              
              
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage(),));

            })
            ,
            ) 
          ),

          Container(
            color: Colors.redAccent,
             height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
              child: Text("START", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              shape: CircleBorder(),
              color: Colors.white,
              

              
              height:150,
              minWidth: 150,
              
              
              onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage(),));

            })
            ,
            

          ))
        ],
      ),

    );
  }
}

class GamePage extends StatefulWidget{
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  double blueCardHeight = 0;
  double redCardHeight = 0;

  int playerAScore = 0;
  int playerBScore = 0;

  bool initialized = false;

  @override
  Widget build(BuildContext context) {
   

    if (initialized == false){
      
    blueCardHeight = MediaQuery.of(context).size.height/2;
    redCardHeight = MediaQuery.of(context).size.height/2;

    initialized = true;


    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            padding: EdgeInsets.zero,
            
            onPressed: (){
             
            setState(() {
              blueCardHeight = blueCardHeight + 30;
              redCardHeight = redCardHeight - 30;
              playerBScore = playerBScore + 5;
              
            });

            double screenHeight = MediaQuery.of(context).size.height;
            double winningHeight = MediaQuery.of(context).size.height -80;

           

            if (blueCardHeight>winningHeight){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(playerBScore, "player B won")));
            }

          },
            child: Container(
              color: Colors.blueAccent,
              height: blueCardHeight,
              width: double.infinity,
              alignment: Alignment.topLeft,
              
            
              child: Row(
                children: [
                  Expanded(child: Text("PLAYER B", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
                  Text(playerBScore.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
            
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.zero,
            
             onPressed: (){
            setState(() {
              redCardHeight = redCardHeight + 30;
              blueCardHeight = blueCardHeight - 30;

              playerAScore = playerAScore + 5;
              

              
            });
            
            
            double winningHeight = MediaQuery.of(context).size.height -80;

           

            if (redCardHeight>winningHeight){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(playerAScore,"Player A won")));
            }
          },
            child: Container(
              color: Colors.redAccent,
              height: redCardHeight,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              
              child: Row(
                children: [
                  Expanded(child: Text("PLAYER A", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
                  Text(playerAScore.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
            
            
            ),
          ),
        ],
      ),

    );
    
    
  }
}

class ResultPage extends StatefulWidget{
  int score = 0;
  String player = "";

  ResultPage(this.score, this.player);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.player == "Player A won" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(widget.player, style: TextStyle(fontSize: 35,fontWeight:FontWeight.bold)),
            Text(widget.score.toString(), style: TextStyle(fontSize: 60, fontWeight:FontWeight.bold)),
            MaterialButton(
              color: Colors.white,
              onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainApp(),));
                });
        
            },
            child: Text("Restart Game")),
            
          ],
        ),
      )

    );
  }
}



