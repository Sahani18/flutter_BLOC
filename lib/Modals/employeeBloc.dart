

//TODO  step 1- imports

//TODO step 2- List of employees

//TODO step 3- define Stream Controller

// TODO step 4- define Stream sink getter

// TODO step 5- Constructor - add data, listen to changes

// TODO step 6- define core functions

// TODO step 7- dispose all streams

import 'dart:async';
import 'employee.dart';

class EmployeeBloc {

  //list of employees

  List<Employee> _employeeList = [
    Employee(1, "Employee 1", 10000.0),
    Employee(2, "Employee 2", 40000.0),
    Employee(3, "Employee 3", 20000.0),
    Employee(4, "Employee 4", 60000.0),
    Employee(5, "Employee 5", 20000.0),
    Employee(6, 'Employee 6', 52000.0)
  ];

  //stream controller

  final _employeeListStreamController = StreamController<List<Employee>>();
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  //stream sink getter

  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;

  //getter for salary increment

  StreamSink<Employee> get employeeSalaryIncrement =>
      _employeeSalaryIncrementStreamController.sink;

  //getter for salary decrement

  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalaryDecrementStreamController.sink;

  //Constructor

  EmployeeBloc(){
    _employeeListStreamController.add(_employeeList);

    //listen to changes

    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }


  //core functionality

  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementedSalary = salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }

  //dispose streams

  void dispose(){
    _employeeListStreamController.close();
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
}
}
