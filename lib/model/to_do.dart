class TODO{
  int id;
  String taskName;
  bool isComlete;


  TODO({this.isComlete,this.taskName,this.id});



  Map<String, dynamic> toMap(){

   Map<String, dynamic> map = {
     "taskName": this.taskName,
     "isComplete":this.isComlete
   };

   return map;



  }




}