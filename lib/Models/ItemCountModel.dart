  import 'package:flutter/cupertino.dart';

class CountInfo with ChangeNotifier{
   int counte=0;
   void inc(){
     counte++;
     notifyListeners();
   }

   void dec(){
     counte--;
     notifyListeners();
   }
  }