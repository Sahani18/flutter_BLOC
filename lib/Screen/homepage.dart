import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/Modals/employee.dart';
import '../Modals/employeeBloc.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    super.dispose();
    _employeeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee App'),
        centerTitle: true,
      ),
      body: Container(
      
       margin: EdgeInsets.all(5),
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.employeeListStream,
          builder: (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {

            return ListView.builder(

                itemCount: snapshot.data.length,

                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.white,
                    shadowColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),

                    elevation: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "${snapshot.data[index].id} ",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "${snapshot.data[index].name} ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "₹ ${snapshot.data[index].salary} ",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.thumb_up,color: Colors.green.shade700,),
                          onPressed:(){
                              //call object from bloc class you have created
                            //then whatever method you want to access defined through custom getter and setter
                            // then call add then add the snapshot and access data
                              _employeeBloc.employeeSalaryIncrement.add(snapshot.data[index]);
                          },
                          ),
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.thumb_down,color: Colors.red.shade400,),
                            onPressed:(){
                              _employeeBloc.employeeSalaryDecrement.add(snapshot.data[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
