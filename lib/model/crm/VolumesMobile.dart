import 'Method.dart';
import 'PestRow.dart';
import 'SquareEntityRow.dart';

class VolumesMobile {
    String created_at;
    int entity;
    int id;
    double kpi;
    int lid_id;
    List<Method> method;
    String note;
    int parent;
    int pest;
    PestRow pest_row;
    double price_fact;
    double price_standard;
    double square;
    SquareEntityRow square_entity_row;
    double square_fact;
    int statistic_id;
    String updated_at;

    VolumesMobile({this.created_at, this.entity, this.id, this.kpi, this.lid_id, this.method, this.note, this.parent, this.pest, this.pest_row, this.price_fact, this.price_standard, this.square, this.square_entity_row, this.square_fact, this.statistic_id, this.updated_at});

    factory VolumesMobile.fromJson(Map<String, dynamic> json) {
        return VolumesMobile(
            created_at: json['created_at'], 
            entity: json['entity'], 
            id: json['id'],
            kpi: json['kpi'] != null ?  double.parse(json['square'].toString())  : 0 ,
            lid_id: json['lid_id'], 
            method: json['method'] != null ? (json['method'] as List).map((i) => Method.fromJson(i)).toList() : null, 
            note: json['note'], 
            parent: json['parent'], 
            pest: json['pest'], 
            pest_row: json['pest_row'] != null ? PestRow.fromJson(json['pest_row']) : null, 
            price_fact: json['price_fact'] != null ?  double.parse(json['price_fact'].toString())  : 0 ,
            price_standard: json['price_standard'] != null ? double.parse(json['price_standard'].toString()) : 0,
            square: json['square'] != null ?  double.parse(json['square'].toString())  : 0 ,
            square_entity_row: json['square_entity_row'] != null ? SquareEntityRow.fromJson(json['square_entity_row']) : null, 
            square_fact: json['square_fact'] != null ?  double.parse(json['square_fact'].toString())  : 0 ,
            statistic_id: json['statistic_id'], 
            updated_at: json['updated_at'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['entity'] = this.entity;
        data['id'] = this.id;
        data['kpi'] = this.kpi;
        data['lid_id'] = this.lid_id;
        data['note'] = this.note;
        data['parent'] = this.parent;
        data['pest'] = this.pest;
        data['price_fact'] = this.price_fact;
        data['price_standard'] = this.price_standard;
        data['square'] = this.square;
        data['square_fact'] = this.square_fact;
        data['statistic_id'] = this.statistic_id;
        data['updated_at'] = this.updated_at;
        if (this.method != null) {
            data['method'] = this.method.map((v) => v.toJson()).toList();
        }
        if (this.pest_row != null) {
            data['pest_row'] = this.pest_row.toJson();
        }
        if (this.square_entity_row != null) {
            data['square_entity_row'] = this.square_entity_row.toJson();
        }
        return data;
    }
}