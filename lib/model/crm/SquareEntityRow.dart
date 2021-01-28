class SquareEntityRow {
    String created_at;
    int id;
    String name;
    String name_short;
    int sort;
    String updated_at;

    SquareEntityRow({this.created_at, this.id, this.name, this.name_short, this.sort, this.updated_at});

    factory SquareEntityRow.fromJson(Map<String, dynamic> json) {
        return SquareEntityRow(
            created_at: json['created_at'], 
            id: json['id'], 
            name: json['name'], 
            name_short: json['name_short'], 
            sort: json['sort'], 
            updated_at: json['updated_at'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['name'] = this.name;
        data['name_short'] = this.name_short;
        data['sort'] = this.sort;
        data['updated_at'] = this.updated_at;
        return data;
    }
}