import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

// ignore: slash_for_doc_comments
/**
 * 비용
 */
const uuId = Uuid();
final dateformatter = DateFormat("yyyy-MM-dd");

// 강의에서 나온 enum을 Icon으로 처리한 것
enum Category {
  food,
  travel,
  leisure,
  work,
  ;
}

const categoryIconse = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff_rounded,
  Category.leisure: Icons.sports_football_outlined,
  Category.work: Icons.card_travel,
};

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

  String get formmattedCreatedAt {
    return dateformatter.format(createdAt);
  }
}
