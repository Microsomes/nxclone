import 'package:flutter/material.dart';

class MetroType {
  static String mDay = "Day";
  static String m3Or4Days = "3 or 3 Days";
  static String m7Day = "7 Days";
  static String mMonthlySeason = "Monthly Season";
  static String mFlexSave = "Flex & Save";
}

class MetroCatModel {
  String title;
  String desc;
  List<MetroTicketModel> allTickets;
  MetroCatModel(
      {@required this.title, @required this.desc, @required this.allTickets});
}

class MetroTicketModel {
  String type;
  double price;
  String desc;
  MetroTicketModel(
      {@required this.type, @required this.price, @required this.desc});
}

class MetroHelperv1 {
  List<MetroCatModel> getAllTicketsCategories() {
    //all day
    List<MetroTicketModel> toTikDay = [];
    toTikDay.add(MetroTicketModel(
        type: "Adult", price: 6.30, desc: "All Day unlimited travel"));
    toTikDay.add(MetroTicketModel(
        type: "Adult Off-Peak",
        price: 4.80,
        desc: "All Day unlimited travel after 09:30"));
    toTikDay.add(MetroTicketModel(
        type: "Child (5-16)", price: 4.60, desc: "All Day unlimited travel"));
    toTikDay.add(MetroTicketModel(
        type: "Child (5-16) off-Peak",
        price: 3.50,
        desc: "All Day unlimited travel after 09:30"));
    toTikDay.add(MetroTicketModel(
        type: "Group (Family only)",
        price: 9.00,
        desc:
            "Mon-Fri all day unlimited travel for up to 2 adults and 4 children"));
    toTikDay.add(MetroTicketModel(
        type: "Group off-Peak (Family only)",
        price: 5.50,
        desc:
            "Unlimited travel for up to 2 adults and 4 children. Mon-Fri after 18:00 & all day weekend + Bank Holidays"));

    //3 or 4 days
    List<MetroTicketModel> toTikDay3or4days = [];
    toTikDay3or4days.add(MetroTicketModel(
        type: "Adult (3 Days)",
        price: 15.00,
        desc:
            "Unlimited travel on West Midlands Metro for 3 consecutive days"));
    toTikDay3or4days.add(MetroTicketModel(
        type: "Adult (4 Days)",
        price: 19.20,
        desc:
            "Unlimited travel on West Midlands Metro for 4 consecutive days"));

    //7 days
    List<MetroTicketModel> toTikDay7days = [];
    toTikDay7days.add(MetroTicketModel(
        type: "Adult",
        price: 23.00,
        desc:
            "Valid for unlimited trips on Midlands Metro within the same operating day"));
    toTikDay7days.add(MetroTicketModel(
        type: "Child (5-16)",
        price: 11.50,
        desc:
            "Valid for unlimited trips on Midlands Metro within the same operating day"));

    //monthly season
    List<MetroTicketModel> toTikDayMonthlySeason = [];
    toTikDayMonthlySeason.add(MetroTicketModel(
        type: "Adult (1 Month)",
        price: 75.00,
        desc:
            "For unlimited travel on West Midlands Metro during the period of validity"));
    toTikDayMonthlySeason.add(MetroTicketModel(
        type: "Child 5-16 (1 Month)",
        price: 37.50,
        desc:
            "For unlimited travel on West Midlands Metro during the period of validity"));

    //flex and save
    List<MetroTicketModel> toTikDayFlexSave = [];
    toTikDayFlexSave.add(MetroTicketModel(
        type: "10 Day Tickets",
        price: 48.00,
        desc:
            "10 days unlimited travel to be used at your convenience. Once the first day is activated the remaining days are valid for 6 months"));

    MetroCatModel dayCat = MetroCatModel(
        allTickets: toTikDay,
        title: "Day",
        desc: "Travel all day, as much as you like");

    MetroCatModel day4Cat = MetroCatModel(
        allTickets: toTikDay3or4days,
        title: "3 or 4 Days",
        desc: "Travel as much as you want for 3 or 4 consecutive days");

    MetroCatModel day7Cat = MetroCatModel(
        allTickets: toTikDay7days,
        title: "7 Days",
        desc: "Travel as much as you want for 7 consecutive days");

    MetroCatModel monthlySeasonCat = MetroCatModel(
        allTickets: toTikDayMonthlySeason,
        title: "Monthly Season",
        desc: "Travel as much as you want for the time periods shown");

    MetroCatModel flexSaveCat = MetroCatModel(
        allTickets: toTikDayFlexSave,
        title: "Flex & Save",
        desc: "10 days unlimited travel to be used at your convenience");

    List<MetroCatModel> allCategoroes = [];

    allCategoroes.add(dayCat);
    allCategoroes.add(day4Cat);
    allCategoroes.add(day7Cat);
    allCategoroes.add(monthlySeasonCat);
    allCategoroes.add(flexSaveCat);

    return allCategoroes;
  }
}
