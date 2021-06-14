
import 'package:flutter/foundation.dart';
import 'package:flutter_app_offline/model/to_do.dart';

class TODOBRAIN extends ChangeNotifier{

  List<TODO> _todos = [];


  Future<List<TODO>>getTODOS()  async  {

    return _todos;

  }



  TODO getTODO(int position){
    return _todos[position];

  }



  void addTODO(TODO newTODO){
    _todos.add(newTODO);
    notifyListeners();
  }



  void editTodo(int position, TODO editTODO){
    _todos[position] = editTODO;
    notifyListeners();
  }


  void deleteTODO (int position){

    _todos.removeAt(position);
    notifyListeners();

  }



}