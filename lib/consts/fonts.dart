import 'consts.dart';
class Appstyle{
  static  normal({String? title,Color? color,double? size,TextAlign align=TextAlign.left}){
    return title!.text.size(size).color(color).align(align).make();
  }
  static  bold({String? title,Color? color,double? size,TextAlign align=TextAlign.left}){
    return title!.text.size(size).color(color).bold.align(align).make();
  }
}