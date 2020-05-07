import 'package:crimsy/widgets/advisor/objects/colorChoice.dart';
import 'package:crimsy/widgets/advisor/objects/stateObject.dart';
import 'package:flutter/material.dart';

List<AdvisorCardObject> todos = [
  AdvisorCardObject.import("SOME_RANDOM_UUID", "Rheinland-Pfalz", 1, ColorChoices.choices[0], Icons.alarm, {
    DateTime(2018, 5, 3): [
      TaskObject("Meet Clients", DateTime(2018, 5, 3)),
      TaskObject("Design Sprint", DateTime(2018, 5, 3)),
      TaskObject("Icon Set Design for Mobile", DateTime(2018, 5, 3)),
      TaskObject("HTML/CSS Study", DateTime(2018, 5, 3)),
    ],
    DateTime(2019, 5, 4): [
      TaskObject("Meet Clients", DateTime(2019, 5, 4)),
      TaskObject("Design Sprint", DateTime(2019, 5, 4)),
      TaskObject("Icon Set Design for Mobile", DateTime(2019, 5, 4)),
      TaskObject("HTML/CSS Study", DateTime(2019, 5, 4)),
    ]
  }),
  AdvisorCardObject("Nordrhein-Westfalen", Icons.person),
  AdvisorCardObject("Bayern", Icons.work),
  AdvisorCardObject("Hessen", Icons.home),
  AdvisorCardObject("Schleswig-Holstein", Icons.shopping_basket),
  AdvisorCardObject("Sachsen", Icons.school),
];
