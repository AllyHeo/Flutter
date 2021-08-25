import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final _formKey = GlobalKey<FormState>();

  final _date = TextEditingController();

  final List<String> country = [
    "서울",
    "부산",
    "대구",
    "인천",
    "광주",
    "대전",
    "울산",
    "세종",
    "경기",
    "강원",
    "충북",
    "충남",
    "전북",
    "전남",
    "경북",
    "경남",
    "제주"
  ];
  final List<String> seoulProvince = ["서울권역"];
  final List<String> busanProvince = ["남부권역", "동부권역", "서부권역", "중부권역"];
  final List<String> daeguProvince = ["대구권역"];
  final List<String> incheonProvince = ["강화권역", "동남부권역", "서부권역", "영종·영흥권역"];
  final List<String> gwangjuProvince = ["광주권역"];
  final List<String> daejeonProvince = ["동부권역", "서부권역"];
  final List<String> ulsanProvince = ["울산권역"];
  final List<String> sejongProvince = ["세종권역"];
  final List<String> gyeonggiProvince = ["남부권", "동부권", "북부권", "중부권"];
  final List<String> gangwonProvince = ["영서북부", "영서남부", "영동북부", "영동남부"];
  final List<String> chungbukProvince = ["북부권역", "중부권역", "남부권역"];
  final List<String> chungnamProvince = ["동남부권역", "북부권역", "서부권역"];
  final List<String> jeonbukProvince = ["중부권역", "서부권역", "동부권역"];
  final List<String> jeonnamProvince = ["동부권역", "서부권역"];
  final List<String> gyeongbukProvince = ["동부권역", "서부권역", "울릉권역"];
  final List<String> gyeongnamProvince = [
    "거제권역",
    "거창권역",
    "고성권역",
    "김해권역",
    "남해권역",
    "밀양권역",
    "사천권역",
    "산청권역",
    "양산권역",
    "의령권역",
    "진주권역",
    "창녕권역",
    "창원권역",
    "통영권역",
    "하동권역",
    "함안권역",
    "함양권역",
    "합천권역"
  ];
  final List<String> jejuProvince = ["제주권역"];

  String? selectedCountry;
  String? selectedProvince;
  List province = [];
/*
  @override
  void dispose() {
    selectedCountry = country[0];
    super.dispose();
  }
*/

  yearPicker() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('년도', textAlign: TextAlign.center),
            content: Container(
              height: MediaQuery.of(context).size.height / 4.0,
              width: MediaQuery.of(context).size.height,
              color: Colors.grey[200],
              child: YearPicker(
                selectedDate: DateTime.now(),
                firstDate: DateTime.utc(2000),
                lastDate: DateTime.now(),
                onChanged: (value) {
                  _date.text = value.toString().substring(0, 4);
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: DropdownButtonFormField(
                  hint: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.public,
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                          text: '   지역',
                        )
                      ],
                    ),
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  value: selectedCountry,
                  validator: (value) {
                    if (value == null) {
                      return '권역를 입력하세요';
                    }
                    return null;
                  },
                  items: country.map(
                    (valueItem) {
                      return DropdownMenuItem(
                          value: valueItem, child: Text(valueItem));
                    },
                  ).toList(),
                  onChanged: (newValue) {
                    if (newValue == "서울") {
                      province = seoulProvince;
                    } else if (newValue == "부산") {
                      province = busanProvince;
                    } else if (newValue == "대구") {
                      province = daeguProvince;
                    } else if (newValue == "부산") {
                      province = busanProvince;
                    } else if (newValue == "인천") {
                      province = incheonProvince;
                    } else if (newValue == "광주") {
                      province = gwangjuProvince;
                    } else if (newValue == "대전") {
                      province = daejeonProvince;
                    } else if (newValue == "울산") {
                      province = ulsanProvince;
                    } else if (newValue == "세종") {
                      province = sejongProvince;
                    } else if (newValue == "경기") {
                      province = gyeonggiProvince;
                    } else if (newValue == "강원") {
                      province = gangwonProvince;
                    } else if (newValue == "충북") {
                      province = chungbukProvince;
                    } else if (newValue == "충남") {
                      province = chungnamProvince;
                    } else if (newValue == "전북") {
                      province = jeonbukProvince;
                    } else if (newValue == "전남") {
                      province = jeonnamProvince;
                    } else if (newValue == "경북") {
                      province = gyeongbukProvince;
                    } else if (newValue == "경남") {
                      province = gyeongnamProvince;
                    } else if (newValue == "제주") {
                      province = jejuProvince;
                    } else {
                      province = [];
                    }

                    setState(() {
                      selectedProvince = null;
                      selectedCountry = newValue as String?;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: DropdownButtonFormField(
                  hint: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.other_houses,
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                          text: '   권역',
                        )
                      ],
                    ),
                  ),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  value: selectedProvince,
                  validator: (value) {
                    if (value == null) {
                      return '권역를 입력하세요';
                    }
                    return null;
                  },
                  items: province.map(
                    (valueItems) {
                      return DropdownMenuItem(
                          value: valueItems, child: Text(valueItems));
                    },
                  ).toList(),
                  onChanged: (newValues) {
                    setState(() {
                      selectedProvince = newValues as String?;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () => yearPicker(),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '검색할 년도를 선택하세요',
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.date_range),
                    ),
                  ),
                  controller: _date,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return '년도를 입력하세요';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: Text('결과'),
              ),
            ),
          ],
        ),
      );
}
