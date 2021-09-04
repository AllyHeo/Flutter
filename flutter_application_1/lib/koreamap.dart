import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class KoreaMap extends StatefulWidget {
  @override
  _KoreaMapState createState() => _KoreaMapState();
}

class _KoreaMapState extends State<KoreaMap> {
  late List<Model> data;
  late MapShapeSource _mapSource;
  int selectedIndex = 1;

  get index => selectedIndex;

  @override
  void initState() {
    data = <Model>[
      Model('강원도', Color.fromRGBO(255, 215, 0, 1.0), '강원'),
      Model('경기도', Color.fromRGBO(72, 209, 204, 1.0), '         경기'),
      Model('경상남도', Colors.red.withOpacity(0.85), '경남'),
      Model('경상북도', Color.fromRGBO(171, 56, 224, 0.75), '경북'),
      Model('광주광역시', Color.fromRGBO(126, 247, 74, 0.75), '광주'),
      Model('대구광역시', Color.fromRGBO(79, 60, 201, 0.7), '대구'),
      Model('대전광역시', Color.fromRGBO(79, 60, 50, 0.7), '대전'),
      Model('부산광역시', Color.fromRGBO(99, 164, 230, 1), '부산'),
      Model('서울특별시', Color.fromRGBO(130, 100, 230, 1), '서울'),
      Model('세종특별자치시', Colors.teal, '세종'),
      Model('울산광역시', Colors.pink, '울산'),
      Model('인천광역시', Colors.orange, '인천'),
      Model('전라남도', Colors.blue, '전남'),
      Model('전라북도', Colors.cyan, '전북'),
      Model('제주특별자치도', Colors.tealAccent, '제주'),
      Model('충청남도', Colors.green, '충남'),
      Model('충청북도', Colors.indigo, '충북'),
    ];

    _mapSource = MapShapeSource.asset(
      'assets/korea_map.json', //파일설정
      shapeDataField: 'CTP_KOR_NM', // 구역설정
      dataCount: data.length,
      primaryValueMapper: (int index) => data[index].state,
      dataLabelMapper: (int index) => data[index].stateCode,
      shapeColorValueMapper: (int index) => data[index].color, // 지도에 색을 뿌려줌
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Column(
        children: [
          Container(
            height: 520,
            child: Center(
              child: SfMaps(
                layers: <MapShapeLayer>[
                  MapShapeLayer(
                    source: _mapSource,

                    legend: MapLegend(MapElement.shape),
                    showDataLabels: true,
                    shapeTooltipBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(7),
                        child: Text(data[index].state,
                            style: themeData.textTheme.caption!.copyWith(
                                color: themeData.colorScheme.surface)),
                      );
                    },
                    tooltipSettings: MapTooltipSettings(
                        color: Colors.grey[700],
                        strokeColor: Colors.white,
                        strokeWidth: 2), // 상세설명 말풍선 설정
                    strokeColor: Colors.white, // 지역별 구분선
                    strokeWidth: 0.5,
                    dataLabelSettings: MapDataLabelSettings(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: themeData
                                .textTheme.caption!.fontSize)), //지도위 표시 텍스트 설정
                    selectedIndex: selectedIndex,

                    onSelectionChanged: (int index) {
                      setState(() {
                        selectedIndex = index;
                        print(selectedIndex);
                      });
                    }, // 지도에서 선택
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              print("Container Clicked");
            },
            child: Container(
              width: 300.0,
              color: Colors.lightBlue[100],
              child: Text(
                '${data[index].state}의 미세먼지 농도는\n 좋음입니다!',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Model {
  Model(this.state, this.color, this.stateCode);

  String state;
  Color color;
  String stateCode;
}
