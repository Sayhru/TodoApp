
// ignore: camel_case_types
class deleted {
  static List workDeleted = [];
  static Map<String, dynamic> workDeletedMap = {};

  List getWorkDeleted(){
    return workDeleted;
  }


  void addDeletedWork(anotation, subject, where) {

    workDeletedMap["deletedTitle"] = anotation;
    workDeletedMap["deletedSubject"] = subject;
    workDeletedMap["where"] = where;
    workDeleted.add(workDeletedMap);

  }


}