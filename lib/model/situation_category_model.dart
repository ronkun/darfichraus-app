class SituationCategory {
  String categoryId;
  String categoryModified;
  String categoryName;
  String categoryIcon;
  String categoryColor;
  String categoryActive;

  SituationCategory ({
    this.categoryId, 
    this.categoryModified, 
    this.categoryName, 
    this.categoryIcon, 
    this.categoryColor, 
    this.categoryActive,
  });

  factory SituationCategory.fromJson(Map<String, dynamic> json){
    return SituationCategory(
      categoryId: json['id'],
      categoryModified: json['modified'],
      categoryName: json['name'],
      categoryIcon: json['icon'],
      categoryColor: json['color'],
      categoryActive: json['active'],
    );
  }
}