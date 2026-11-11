import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFeef0f4);
const Color secondaryColor = Color(0xFFd3d7dc);
const Color thirdColor = Color(0xFF405f9e);
const Color forthColor = Color(0xFF243b6f);
const kSecondarycolor = Color(0xFFfcca46);

const kDefaultPadding = 20.0;

// api
const linkserver = "http://localhost:8000/api";
const link = 'http://127.0.0.1:8000/api';
//get
const linkuser = "$linkserver/user";
const linkproduct = "$linkserver/medicals";
const linkproductid = "$linkserver/medicalsid";
const linkcate = "$linkserver/category";
const linkorder = "$linkserver/order";
//post
const linkuserpost = "$link/userpost";
const linkorderpost = "$linkserver/orderpost";
const linkorderupdate = "$linkserver/orderupdate";
const linkproductpost = "$linkserver/medicalpost";
const linkproductupdate = "$linkserver/medupdate";
const linkcatepost = "$linkserver/catepost";

//image
const List<String> myimage = [
  'images/capsules.png',
  'images/capsule1.png',
  'images/capsule2.png',
  'images/capsule3.png',
  'images/capsule4.png',
];
