import 'package:rosses_mobile_master/model/crm/ActExecution.dart';
import 'package:rosses_mobile_master/model/crm/AuditPhoto.dart';
import 'package:rosses_mobile_master/model/crm/VolumesMobile.dart';

class Act {
  String act_nr;
  String address;
  String booking_act_file;
  int booking_act_signed;
  int booking_act_transferred;
  int card_payment;
  int cash;
  int cash_tag;
  int cashless;
  int cashless_tag;
  String comment;
  String contact;
  String contact_name;
  int contractor_fee;
  String contractor_fee_cash;
  String contractor_fee_cashless;
  String cost_labor;
  String cost_remedy;
  String cost_transport;
  String created_at;
  int creator;
  String destination;
  int finished;
  int floating;
  String floating_date_from;
  String floating_date_to;
  int id;
  String implement_act_file;
  int implement_act_signed;
  String lat;
  String lon;
  int overpay;
  String overpay_rest;
  int paid;
  int parent;
  int pay_back;
  String pay_back_cash;
  String pay_back_cashless;
  String phone;
  String phone_ext;
  String phone_ext_sub;
  String phone_sub;
  String prefer_time_from;
  String prefer_time_to;
  int property_type;
  String region;
  int reserved;
  int statistic_id;
  int subact;
  int subact_type;
  String updated_at;
  List<VolumesMobile> volumes_mobile;
  ActExecution execution;
  List<AuditPhoto> audit_photos;

  Act(
      {this.act_nr,
      this.address,
      this.booking_act_file,
      this.booking_act_signed,
      this.booking_act_transferred,
      this.card_payment,
      this.cash,
      this.cash_tag,
      this.cashless,
      this.cashless_tag,
      this.comment,
      this.contact,
      this.contact_name,
      this.contractor_fee,
      this.contractor_fee_cash,
      this.contractor_fee_cashless,
      this.cost_labor,
      this.cost_remedy,
      this.cost_transport,
      this.created_at,
      this.creator,
      this.destination,
      this.finished,
      this.floating,
      this.floating_date_from,
      this.floating_date_to,
      this.id,
      this.implement_act_file,
      this.implement_act_signed,
      this.lat,
      this.lon,
      this.overpay,
      this.overpay_rest,
      this.paid,
      this.parent,
      this.pay_back,
      this.pay_back_cash,
      this.pay_back_cashless,
      this.phone,
      this.phone_ext,
      this.phone_ext_sub,
      this.phone_sub,
      this.prefer_time_from,
      this.prefer_time_to,
      this.property_type,
      this.region,
      this.reserved,
      this.statistic_id,
      this.subact,
      this.subact_type,
      this.updated_at,
      this.volumes_mobile,
      this.execution,
      this.audit_photos});

  factory Act.fromJson(Map<String, dynamic> json) {
    return Act(
      act_nr: json['act_nr'],
      address: json['address'],
      booking_act_file: json['booking_act_file'],
      booking_act_signed: json['booking_act_signed'],
      booking_act_transferred: json['booking_act_transferred'],
      card_payment: json['card_payment'],
      cash: json['cash'],
      cash_tag: json['cash_tag'],
      cashless: json['cashless'],
      cashless_tag: json['cashless_tag'],
      comment: json['comment'],
      contact: json['contact'],
      contact_name: json['contact_name'],
      contractor_fee: json['contractor_fee'],
      contractor_fee_cash: json['contractor_fee_cash'],
      contractor_fee_cashless: json['contractor_fee_cashless'],
      cost_labor: json['cost_labor'],
      cost_remedy: json['cost_remedy'],
      cost_transport: json['cost_transport'],
      created_at: json['created_at'],
      creator: json['creator'],
      destination: json['destination'],
      finished: json['finished'],
      floating: json['floating'],
      floating_date_from: json['floating_date_from'],
      floating_date_to: json['floating_date_to'],
      id: json['id'],
      implement_act_file: json['implement_act_file'],
      implement_act_signed: json['implement_act_signed'],
      lat: json['lat'],
      lon: json['lon'],
      overpay: json['overpay'],
      overpay_rest: json['overpay_rest'],
      paid: json['paid'],
      parent: json['parent'],
      pay_back: json['pay_back'],
      pay_back_cash: json['pay_back_cash'],
      pay_back_cashless: json['pay_back_cashless'],
      phone: json['phone'],
      phone_ext: json['phone_ext'],
      phone_ext_sub: json['phone_ext_sub'],
      phone_sub: json['phone_sub'],
      prefer_time_from: json['prefer_time_from'],
      prefer_time_to: json['prefer_time_to'],
      property_type: json['property_type'],
      region: json['region'],
      reserved: json['reserved'],
      statistic_id: json['statistic_id'],
      subact: json['subact'],
      subact_type: json['subact_type'],
      updated_at: json['updated_at'],
      volumes_mobile: json['volumes_mobile'] != null
          ? (json['volumes_mobile'] as List)
              .map((i) => VolumesMobile.fromJson(i))
              .toList()
          : null,
      execution: json['execution'] != null
          ? ActExecution.fromJson(json['execution'])
          : null,
      audit_photos: json['audit_photos'] != null
          ? (json['audit_photos'] as List)
          .map((i) => AuditPhoto.fromJson(i))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['act_nr'] = this.act_nr;
    data['address'] = this.address;
    data['booking_act_file'] = this.booking_act_file;
    data['booking_act_signed'] = this.booking_act_signed;
    data['booking_act_transferred'] = this.booking_act_transferred;
    data['card_payment'] = this.card_payment;
    data['cash'] = this.cash;
    data['cash_tag'] = this.cash_tag;
    data['cashless'] = this.cashless;
    data['cashless_tag'] = this.cashless_tag;
    data['comment'] = this.comment;
    data['contact'] = this.contact;
    data['contact_name'] = this.contact_name;
    data['contractor_fee'] = this.contractor_fee;
    data['contractor_fee_cash'] = this.contractor_fee_cash;
    data['contractor_fee_cashless'] = this.contractor_fee_cashless;
    data['cost_labor'] = this.cost_labor;
    data['cost_remedy'] = this.cost_remedy;
    data['cost_transport'] = this.cost_transport;
    data['created_at'] = this.created_at;
    data['creator'] = this.creator;
    data['destination'] = this.destination;
    data['finished'] = this.finished;
    data['floating'] = this.floating;
    data['floating_date_from'] = this.floating_date_from;
    data['floating_date_to'] = this.floating_date_to;
    data['id'] = this.id;
    data['implement_act_file'] = this.implement_act_file;
    data['implement_act_signed'] = this.implement_act_signed;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['overpay'] = this.overpay;
    data['overpay_rest'] = this.overpay_rest;
    data['paid'] = this.paid;
    data['parent'] = this.parent;
    data['pay_back'] = this.pay_back;
    data['pay_back_cash'] = this.pay_back_cash;
    data['pay_back_cashless'] = this.pay_back_cashless;
    data['phone'] = this.phone;
    data['phone_ext'] = this.phone_ext;
    data['phone_ext_sub'] = this.phone_ext_sub;
    data['phone_sub'] = this.phone_sub;
    data['prefer_time_from'] = this.prefer_time_from;
    data['prefer_time_to'] = this.prefer_time_to;
    data['property_type'] = this.property_type;
    data['region'] = this.region;
    data['reserved'] = this.reserved;
    data['statistic_id'] = this.statistic_id;
    data['subact'] = this.subact;
    data['subact_type'] = this.subact_type;
    data['updated_at'] = this.updated_at;
    if (this.volumes_mobile != null) {
      data['volumes_mobile'] =
          this.volumes_mobile.map((v) => v.toJson()).toList();
    }
    if (this.execution != null) {
      data['act_execution'] = this.execution.toJson();
    }
    if (this.audit_photos != null) {
      data['audit_photos'] =
          this.audit_photos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
