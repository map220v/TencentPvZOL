package com.qq.utils
{
   import PVZ.Cmd.E_DiamondFlag;
   import PVZ.Cmd.E_DiamondType;
   import asgui.controls.Image;
   import asgui.core.Container;
   import com.qq.modules.main.model.PrivilegeDiamond;
   
   public class PrivilegeUtils
   {
       
      
      public function PrivilegeUtils()
      {
         super();
      }
      
      public static function isBlueDiamondNoraml(param1:uint) : Boolean
      {
         return check(param1,E_DiamondFlag.E_DiamondFlag_Blue);
      }
      
      public static function isBlueDiamondLuxury(param1:uint) : Boolean
      {
         return check(param1,E_DiamondFlag.E_DiamondFlag_Blue_High);
      }
      
      public static function isBlueDiamondYear(param1:uint) : Boolean
      {
         return check(param1,E_DiamondFlag.E_DiamondFlag_Blue_Year);
      }
      
      public static function hasBlueDiamond(param1:uint) : Boolean
      {
         return isBlueDiamondNoraml(param1) || isBlueDiamondLuxury(param1) || isBlueDiamondYear(param1);
      }
      
      public static function hasYellowDiamond(param1:uint) : Boolean
      {
         return isYellowDiamondNormal(param1) || isYellowDiamondLuxury(param1) || isYellowDiamondYear(param1);
      }
      
      public static function isYellowDiamondNormal(param1:uint) : Boolean
      {
         return check(param1,E_DiamondFlag.E_DiamondFlag_Yellow);
      }
      
      public static function isYellowDiamondYear(param1:uint) : Boolean
      {
         return check(param1,E_DiamondFlag.E_DiamondFlag_Yellow_Year);
      }
      
      public static function isYellowDiamondLuxury(param1:uint) : Boolean
      {
         return check(param1,E_DiamondFlag.E_DiamondFlag_Yellow_High);
      }
      
      private static function check(param1:uint, param2:uint) : Boolean
      {
         return (param1 >> param2 & 1) > 0;
      }
      
      public static function getPrivilegeIconUrl_BlueDiamond(param1:uint, param2:int) : String
      {
         var _loc3_:String = null;
         if(PrivilegeUtils.isBlueDiamondLuxury(param1))
         {
            _loc3_ = UrlManager.getUrl(UrlManager.Url_BlueVip,"luxury/" + param2 + ".png");
         }
         else if(param2 != 0)
         {
            _loc3_ = UrlManager.getUrl(UrlManager.Url_BlueVip,"normal/" + param2 + ".png");
         }
         return _loc3_;
      }
      
      public static function get3366IconURL() : String
      {
         return UrlManager.getUrl(UrlManager.Url_Privilege,"3366.png");
      }
      
      public static function addImagesToContainer(param1:Container, param2:PrivilegeDiamond) : void
      {
         var _loc3_:Container = null;
         var _loc4_:int = 0;
         var _loc5_:Image = null;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Image = null;
         if(param2)
         {
            _loc3_ = param1;
            _loc3_.mouseChildren = false;
            _loc4_ = 20;
            _loc5_ = new Image();
            _loc6_ = param2.getLevel(E_DiamondType.E_DiamondType_Blue);
            _loc5_.source = PrivilegeUtils.getPrivilegeIconUrl_BlueDiamond(param2.tag,_loc6_);
            _loc3_.addChild(_loc5_);
            if(_loc7_ = PrivilegeUtils.isBlueDiamondYear(param2.tag))
            {
               (_loc8_ = new Image()).x = 20;
               _loc8_.source = UrlManager.getUrl(UrlManager.Url_BlueVip,"yearVip.png");
               _loc3_.addChild(_loc8_);
               _loc4_ = 40;
            }
         }
      }
   }
}
