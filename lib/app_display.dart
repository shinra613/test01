import 'package:flutter/material.dart';

class AppDisplayContainer extends StatefulWidget {
  const AppDisplayContainer({super.key});

  @override
  State<AppDisplayContainer> createState() {
    return _AppDisplayState();
  }
}

class _AppDisplayState extends State<AppDisplayContainer> {
  final TextEditingController myController = TextEditingController();
  final List<String> taskList = [];

  void stateUpdate() {
    setState(() {
      if (myController.text.isNotEmpty) {
        taskList.add(myController.text);
        myController.clear();
      }
    });
  }

   deleteItem (index){
    setState(() {
      taskList.removeAt(index);
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
         ),
      padding: const EdgeInsets.only(top: 150.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: myController,
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        hintText: 'Enter a task',
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox(width: 1,)),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                         minimumSize: const Size(double.infinity, 60),
                        
                      ),
                      onPressed: stateUpdate,
                      child: const Text("Add Task"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded( 
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return  ListTile(
                    selectedColor: const Color.fromARGB(255, 52, 167, 213),
                    title: Container(
                      decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide()
                      )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                          flex: 4,
                            child: Text(taskList[index])),
                          Expanded(
                            flex: 1,
                            child: TextButton(  onPressed:()=>deleteItem(index) ,child:const Text('X'))),
                        ],
                      )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
