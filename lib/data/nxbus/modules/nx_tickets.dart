import '../nxdb.dart';

class NxTickets extends NXDatabase {
  Future getAllTickets() async {
    var db = await getDbInstance();
    var result = await db.rawQuery("SELECT * FROM nx_tickets");
    db.close();
    return result;
  }

  Future getTicketCategories() async {
    var db = await getDbInstance();
    var result =
        await db.rawQuery("SELECT DISTINCT(parentCatrgory) FROM nx_tickets");
    db.close();
    return result;
  }

  Future getTicketsByCategory(String parentCategory) async {
    var db = await getDbInstance();
    var result = await db.rawQuery(
        "SELECT * FROM nx_tickets where parent_category = '$parentCategory'");
    db.close();
    return result;
  }
}
