import 'package:flutter/cupertino.dart';

/**
* @author huangxuan
* @since 2022/9/20 17:04
* QQ: 1360643904
* 生成热搜列表Item
*/
Widget generateItem(Widget tip,List dataList,int index){
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    dataList[index]["pic"],
                    height: 80,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Flex(
                  mainAxisSize: MainAxisSize.min,
                  direction: Axis.vertical,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("${dataList[index]["title"]}"),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin:
                        const EdgeInsets.fromLTRB(3, 10, 0, 0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10)),
                              child: Image.network(
                                dataList[index]["owner"]["face"],
                                width: 20,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text(
                                  "${dataList[index]["owner"]["name"]}"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        tip
      ],
    ),
  );
}