class PestRow {
    int active;
    String created_at;
    int id;
    List<String> methods;
    String name;
    int sort;
    String updated_at;

    PestRow({this.active, this.created_at, this.id, this.methods, this.name, this.sort, this.updated_at});

    factory PestRow.fromJson(Map<String, dynamic> json) {
        return PestRow(
            active: json['active'], 
            created_at: json['created_at'], 
            id: json['id'], 
            methods: json['methods'] != null ? new List<String>.from(json['methods']) : null, 
            name: json['name'], 
            sort: json['sort'], 
            updated_at: json['updated_at'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['active'] = this.active;
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['name'] = this.name;
        data['sort'] = this.sort;
        data['updated_at'] = this.updated_at;
        if (this.methods != null) {
            data['methods'] = this.methods;
        }
        return data;
    }
}