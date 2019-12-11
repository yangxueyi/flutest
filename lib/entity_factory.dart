
import 'package:flutest/bean/load_detail_entity.dart';
import 'package:flutest/bean/loan_bean_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "LoadDetailEntity") {
      return LoadDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "LoanBeanEntity") {
      return LoanBeanEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}