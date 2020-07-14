import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeListView extends StatefulWidget {
  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  static const a1 =
      "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1268294014,262771225&fm=26&gp=0.jpg";
  static const a2 =
      "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3399956479,3872406492&fm=26&gp=0.jpg";
  static const a3 =
      "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1211580473,1846767688&fm=26&gp=0.jpg";
  static const a4 =
      "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2290280166,2266545977&fm=26&gp=0.jpg";
  static const a5 =
      "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=284254152,3000221406&fm=11&gp=0.jpg";
  static const a6 =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594744391718&di=b64446032b69d13bfca55c8cbb96f82f&imgtype=0&src=http%3A%2F%2Fpic.qqtn.com%2Fup%2F2018-2%2F15196912744784620.jpg";
  static const a7 =
      "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2384063294,1698559024&fm=11&gp=0.jpg";
  static const a8 =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594744391717&di=5bbbd6c025c374884e134961d4873310&imgtype=0&src=http%3A%2F%2Fphoto.tuchong.com%2F3770578%2Ff%2F561237536.jpg";
  static const a9 =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594744391717&di=ad5c4cccfc9e03c3764a7987d56f9798&imgtype=0&src=http%3A%2F%2Fpic.qqtn.com%2Fup%2F2018-4%2F15228903381498746.jpg";
  static const a10 =
      "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3646670793,4035985096&fm=26&gp=0.jpg";

  List<String> a = [a1, a2, a3, a4, a5, a6, a7, a8, a9, a10];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  List<HomeModel> _retrieveData() {
    List<HomeModel> homeModels = new List<HomeModel>();
    List.generate(
        10,
        (index) => {
              homeModels.add(
                  new HomeModel(a[index], "$index", "content", "100.00", "100.00"))
            });
    return homeModels;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          HomeModel homeModel = _retrieveData()[index];
          return Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.redAccent),
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(homeModel.avatarUrl),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
//                      crossAxisAlignment:CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Container(
                        child: Text(homeModel.title),
                      ),
                      Container(
                        child: Text(homeModel.content),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(homeModel.income,style: TextStyle(color: Colors.redAccent),),
                      Text(homeModel.amountPaid,style: TextStyle(color: Colors.green))
                    ],
                  ),
                ),
                Container(
                  width: 20,
                  height: 10,
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(height: .0,indent: 10,endIndent: 20,),
        itemCount: _retrieveData().length);
  }
}

class HomeModel {
  /// 头像
  String avatarUrl;

  /// 标题
  String title;

  // 内容
  String content;

  //收入
  String income;

  //支出
  String amountPaid;

  HomeModel(
      this.avatarUrl, this.title, this.content, this.income, this.amountPaid);
}
