package com.qq.constant.city
{
   import com.qq.utils.UrlManager;
   
   public class CityButtonConstant
   {
      
      public static const ID_BUTTON_QUEST:int = 1;
      
      public static const ID_BUTTON_FUBEN:int = 2;
      
      public static const ID_BUTTON_WORLD_MAP:int = 4;
      
      public static const ID_BUTTON_SHOP:int = 5;
      
      public static const ID_BUTTON_Illustrations:int = 6;
      
      public static const ID_BUTTON_Dummy:int = 7;
      
      public static const Name_Quest:String = "openQuestListBtn";
      
      public static const Name_Fuben:String = "btnToFuben";
      
      public static const Name_TD:String = "levelSelectBtn";
      
      public static const Name_MAIL:String = "openMailBtn";
      
      public static const Name_MAIL2:String = "openMailBtn2";
      
      public static const Name_Bag:String = "Name_Bag";
      
      public static const Name_WorldMap:String = "worldMapBtn";
      
      public static const Name_Shop:String = "shopBtn";
      
      public static const Name_Friend:String = "Name_Friend";
      
      public static const Name_Illustrations:String = "Name_Illustrations";
      
      public static const Name_Dummy:String = "Name_Dummy";
      
      public static const Sort_List:Array = [Name_Shop,Name_MAIL,Name_Dummy,Name_Illustrations,Name_Bag,Name_Quest,Name_Friend,Name_WorldMap,Name_Fuben,Name_TD];
      
      public static const Right_Sort_List:Array = [Name_WorldMap,Name_Fuben,Name_TD];
      
      public static const Bottom_Sort_List:Array = [Name_Shop,Name_MAIL,Name_Dummy,Name_Illustrations,Name_Bag,Name_Quest,Name_Friend];
      
      public static const City_Btn_Bottom:int = 0;
      
      public static const City_Btn_Right:int = 1;
      
      public static var buttonResList:Array = new Array();
      
      public static const TD_BUTTON_OPEN:String = "TD_BUTTON_OPEN";
      
      public static const WORLD_BUTTON_OPEN:String = "WORLD_BUTTON_OPEN";
      
      public static const ADVENTURE_BUTTON_OPEN:String = "ADVENTURE_BUTTON_OPEN";
      
      public static const QUEST_BUTTON_OPEN:String = "QUEST_BUTTON_OPEN";
      
      {
         buttonResList[Name_Quest] = UrlManager.getUrl(UrlManager.Url_CityBuilding,"new_btn_to_quest.swf");
         buttonResList[Name_Fuben] = UrlManager.getUrl(UrlManager.Url_CityBuilding,"new_btn_to_fuben.swf");
         buttonResList[Name_MAIL] = UrlManager.getUrl(UrlManager.Url_CityBuilding,"new_btn_to_mail.swf");
         buttonResList[Name_MAIL2] = UrlManager.getUrl(UrlManager.Url_CityBuilding,"btn_to_mail.swf");
         buttonResList[Name_Bag] = UrlManager.getUrl(UrlManager.Url_CityBuilding,"new_btn_to_bag.swf");
         buttonResList[Name_WorldMap] = UrlManager.getUrl(UrlManager.Url_CityBuilding,"new_btn_to_worldMap.swf");
         buttonResList[Name_Shop] = UrlManager.getUrl(UrlManager.Url_CityBuilding,"new_btn_to_shop.swf");
         buttonResList[Name_Friend] = UrlManager.getUrl(UrlManager.Url_CityBuilding,"new_btn_to_friend.swf");
         buttonResList[Name_Illustrations] = UrlManager.getUrl(UrlManager.Url_CityBuilding,"new_btn_to_illustrations.swf");
         buttonResList[Name_Dummy] = UrlManager.getUrl(UrlManager.Url_CityBuilding,"new_btn_to_dummy.swf");
      }
      
      public function CityButtonConstant()
      {
         super();
      }
      
      public static function getSortIndex(param1:String) : int
      {
         return int(Sort_List.indexOf(param1));
      }
      
      public static function getBtnListType(param1:String) : int
      {
         var _loc2_:int = 0;
         switch(param1)
         {
            case Name_WorldMap:
            case Name_Fuben:
            case Name_TD:
               _loc2_ = City_Btn_Right;
               break;
            default:
               _loc2_ = City_Btn_Bottom;
         }
         return _loc2_;
      }
   }
}
