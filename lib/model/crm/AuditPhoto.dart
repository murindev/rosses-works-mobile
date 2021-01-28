class AuditPhoto {
    int act_id;
    String created_at;
    int id;
    String photo;
    String updated_at;

    AuditPhoto({this.act_id, this.created_at, this.id, this.photo, this.updated_at});

    factory AuditPhoto.fromJson(Map<String, dynamic> json) {
        return AuditPhoto(
            act_id: json['act_id'], 
            created_at: json['created_at'], 
            id: json['id'], 
            photo: json['photo'], 
            updated_at: json['updated_at'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['act_id'] = this.act_id;
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['photo'] = this.photo;
        data['updated_at'] = this.updated_at;
        return data;
    }
}