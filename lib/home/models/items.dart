// ignore_for_file: public_member_api_docs, sort_constructors_first
class Items {
  String assets;
  String name;
  Items({
    required this.assets,
    required this.name,
  });
}

List<Items> items = [Items(assets: 'apartment', name: 'Rent'),Items(assets: 'sale', name: 'Sale'),Items(assets: 'food_discount', name: 'Discount')];