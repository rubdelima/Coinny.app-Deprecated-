import 'package:flutter/material.dart';
import 'package:learn/classes/children.dart';
import 'package:learn/docs/sugestions/sugestion_01.dart';

Widget getSugestion(int id, Map<String, dynamic> args){
  switch(id){
    case 1:
      return Sugestion_01(children: args['children']  as Children);
  }
  return Container();
}
