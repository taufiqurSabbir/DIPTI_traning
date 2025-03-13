import 'package:dpit/todo.dart';
import 'package:dpit/todo_list.dart';
import 'package:dpit/widget/custom_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   Home({super.key});

   TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('App bar'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => Scaffold.of(context).openDrawer(),
     icon: Icon(Icons.more))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
            SizedBox(height: 25,),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  TodoList()),
                );
              }, child: Text('Todo Screen')),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.datetime,

               decoration: InputDecoration(
                  suffixIcon: Icon(Icons.add),
                 labelText: 'Name',
                 hintText: 'Enter your name',
                 hintStyle: TextStyle(
                   fontSize: 20,
                   color: Colors.blue
                 )
               ),
              ),






              SizedBox(
                height: 500,
                width: double.infinity,
                child: ListView.builder(
                  itemCount:20 ,
                    itemBuilder: (context,index){
                    return  ListTile(
                        title: Text('Rahim $index'),
                        subtitle: Text('rahim@gmail.com'),
                        leading: Icon(Icons.person),
                        trailing:
                        Icon(Icons.delete)
                    );
                    }
                
                ),
              ),

              ElevatedButton(onPressed: (){
                print(nameController.text);
              }, child: Text('Get value')),





              SizedBox(height: 25,),

              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKzxPZE64b_jmQ2igcXaKkRNOdapo5p34JIA&s'),
              Image.asset('assets/images/caption.jpg',
              height: 200,
                width: 200,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20)),
                child: Center(),
              ),

              SizedBox(height: 20,),

              customCard(text: 'Tfg', number: '12',),
              customCard(text: 'fgf', number: '54',),
              customCard(text: 'fgdg', number: '45',),


              Text("Hello text"),


              InkWell(
                onTap: (){
                  print('clicked moon');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Moon'),
                    Icon(
                      Icons.dark_mode,
                      color: Colors.black,
                      size: 50,
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: (){
                  print('clicked moon');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sun'),
                    Icon(
                      Icons.sunny,
                      color: Colors.orange,
                      size: 50,
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Text('Delete'),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ],
              ),
              TextButton(
                  onPressed: () {
                    print("Clicked me");
                  },
                  child: Text('Click me')),
              Padding(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Text('Click me')),
                ),
              ),
              Text("hello word"),
              SizedBox(
                height: 20,
              ),
              Text("hello word"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("hello word"),
                  Text("hello word"),
                  Text("hello word"),
                  Text("hello word"),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
        onPressed: () {},
      ),
    );
  }
}

