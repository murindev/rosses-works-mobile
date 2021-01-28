class ActExecution {
    int act_id;
    String departured;
    String arrived;
    String audit;
    String contract;
    String finished;
    String record_file;
    int step;
    int id;

    ActExecution({this.act_id, this.arrived, this.audit, this.contract, this.departured, this.finished, this.step, this.id, this.record_file});

    factory ActExecution.fromJson(Map<String, dynamic> json) {
        return ActExecution(
            act_id: json['act_id'], 
            arrived: json['arrived'], 
            audit: json['audit'], 
            contract: json['contract'], 
            departured: json['departured'], 
            finished: json['finished'], 
            step: json['step'],
            id: json['id'],
            record_file: json['record_file'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['act_id'] = this.act_id;
        data['arrived'] = this.arrived;
        data['audit'] = this.audit;
        data['contract'] = this.contract;
        data['departured'] = this.departured;
        data['finished'] = this.finished;
        data['step'] = this.step;
        data['id'] = this.id;
        data['record_file'] = this.record_file;
        return data;
    }
}