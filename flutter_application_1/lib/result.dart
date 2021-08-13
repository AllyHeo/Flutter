class Autogenerated {
  Response? response;

  Autogenerated({this.response});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  Body? body;
  Header? header;

  Response({this.body, this.header});

  Response.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    header =
        json['header'] != null ? new Header.fromJson(json['header']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    if (this.header != null) {
      data['header'] = this.header!.toJson();
    }
    return data;
  }
}

class Body {
  int? totalCount;
  List<Items>? items;
  int? pageNo;
  int? numOfRows;

  Body({this.totalCount, this.items, this.pageNo, this.numOfRows});

  Body.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];

    if (json['items'] != null) {
      //items = new List<Items>(); //원래 코드

      items = <Items>[];

      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }

    pageNo = json['pageNo'];
    numOfRows = json['numOfRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }

    data['pageNo'] = this.pageNo;
    data['numOfRows'] = this.numOfRows;
    return data;
  }
}

class Items {
  String? clearVal;
  String? sn;
  String? districtName;
  String? dataDate;
  String? issueVal;
  String? issueTime;
  String? clearDate;
  String? issueDate;
  String? moveName;
  String? clearTime;
  String? issueGbn;
  String? itemCode;

  Items(
      {this.clearVal,
      this.sn,
      this.districtName,
      this.dataDate,
      this.issueVal,
      this.issueTime,
      this.clearDate,
      this.issueDate,
      this.moveName,
      this.clearTime,
      this.issueGbn,
      this.itemCode});

  Items.fromJson(Map<String, dynamic> json) {
    clearVal = json['clearVal'];
    sn = json['sn'];
    districtName = json['districtName'];
    dataDate = json['dataDate'];
    issueVal = json['issueVal'];
    issueTime = json['issueTime'];
    clearDate = json['clearDate'];
    issueDate = json['issueDate'];
    moveName = json['moveName'];
    clearTime = json['clearTime'];
    issueGbn = json['issueGbn'];
    itemCode = json['itemCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clearVal'] = this.clearVal;
    data['sn'] = this.sn;
    data['districtName'] = this.districtName;
    data['dataDate'] = this.dataDate;
    data['issueVal'] = this.issueVal;
    data['issueTime'] = this.issueTime;
    data['clearDate'] = this.clearDate;
    data['issueDate'] = this.issueDate;
    data['moveName'] = this.moveName;
    data['clearTime'] = this.clearTime;
    data['issueGbn'] = this.issueGbn;
    data['itemCode'] = this.itemCode;
    return data;
  }
}

class Header {
  String? resultMsg;
  String? resultCode;

  Header({this.resultMsg, this.resultCode});

  Header.fromJson(Map<String, dynamic> json) {
    resultMsg = json['resultMsg'];
    resultCode = json['resultCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultMsg'] = this.resultMsg;
    data['resultCode'] = this.resultCode;
    return data;
  }
}
