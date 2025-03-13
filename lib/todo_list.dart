import 'package:dpit/home.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> todos = [];
  TextEditingController taskController = TextEditingController();
  TextEditingController editController = TextEditingController();

  void updateTask(int index) {
    todos[index] = editController.text;
    Navigator.pop(context);
    setState(() {});
  }

  void editTask(int index) {
    editController.text = todos[index];
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Edit Task'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: editController,
                    decoration: InputDecoration(hintText: 'Update task'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => updateTask(index), child: Text('Update'))
                ],
              ),
            ));
  }

  void addTask() {
    if (taskController.text != '') {
      todos.add(taskController.text.trim());
      taskController.clear();
    }
    setState(() {});
  }

  void deleteTask(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg'),
                ),
                Text("Jhon Akht",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("jhson@gmail.com")
              ],
            )),

            ListTile(
              leading: Icon(Icons.home_filled),
              title: Text('Home'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  Home()),
                );

              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Home'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet_sharp),
              title: Text('Home'),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: (){

              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Todo List'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: taskController,
              decoration: InputDecoration(
                hintText: 'Enter a task',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => addTask(),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                      background: Container(color: Colors.red,child: Icon(Icons.delete,color: Colors.white,),),
                      onDismissed: (decoration)=>deleteTask(index),
                    child: Card(
                      child: ListTile(
                        title: Text(todos[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  editTask(index);
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () => deleteTask(index),
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
