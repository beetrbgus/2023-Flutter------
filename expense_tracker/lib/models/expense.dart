import 'package:uuid/uuid.dart';

// ignore: slash_for_doc_comments
/**
 * 비용
 * zz
 * 
 */
const uuId = Uuid();

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.createdAt,
    required this.category,
  }) : id = uuId.v8();

  final String id;
  final String title; // 제목
  final double amount; // 비용
  final DateTime createdAt; //  생성일
  final Category category; // 사용처
}

enum Category {
  food,
  travel,
  leisure,
  work,
  ;
}
