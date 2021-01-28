class Method {
    int cost;
    String created_at;
    int id;
    String name;
    int sort;
    int unit;
    String updated_at;

    Method({this.cost, this.created_at, this.id, this.name, this.sort, this.unit, this.updated_at});

    factory Method.fromJson(Map<String, dynamic> json) {
        return Method(
            cost: json['cost'], 
            created_at: json['created_at'], 
            id: json['id'], 
            name: json['name'], 
            sort: json['sort'], 
            unit: json['unit'], 
            updated_at: json['updated_at'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cost'] = this.cost;
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['name'] = this.name;
        data['sort'] = this.sort;
        data['unit'] = this.unit;
        data['updated_at'] = this.updated_at;
        return data;
    }
}