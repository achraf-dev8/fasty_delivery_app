
String? validInput(String val, int min, int max, String type, var parentController){


  RegExp? regExp;
  if(val.isEmpty){
    "Enter an $type";
  }

  if(type == "Name"){

     regExp = RegExp(r"^[A-Za-z]+(([',. -][A-Za-z ])?[A-Za-z]*)*$");
     
  }else if(type == "Phone number"){
    regExp = RegExp(r'^[\d\s\-()+]{7,}$',
    caseSensitive: false,);
  }
  else if(type == "Password"){
    const String wrongMsg= "Password must be at least 8 characters, include at least one letter and one number.";

   if (val.length < 8) {
    return wrongMsg;
  }
  
  final letterRegExp = RegExp(r'[a-zA-Z]');
  final numberRegExp = RegExp(r'\d');
  
  bool hasLetter = letterRegExp.hasMatch(val);
  bool hasNumber = numberRegExp.hasMatch(val);
  if(!hasLetter || !hasNumber){
    return wrongMsg;
  } }

  if(regExp != null){
    if(!regExp.hasMatch(val)){
      return "$type is not valid";
    }
    
  }

  if(val.length< min){
    return "$type is too short";
  }
    if(val.length> max){
    return "$type is too long";
  }
    if(parentController != null){
        return parentController.wrongLoginInfo;  
    }
    
    return null;
}