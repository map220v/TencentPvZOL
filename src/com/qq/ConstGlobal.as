package com.qq
{
   import PVZ.Cmd.E_PowerEle;
   
   public class ConstGlobal
   {
      
      public static var gameVersion:String;
      
      public static var useSourceUrlInDevelopMode:Boolean = true;
      
      public static var initSocket:Array;
      
      public static const PROP_SHOW_ORDER:Array = [E_PowerEle.E_PowerEle_total,E_PowerEle.E_PowerEle_nature,E_PowerEle.E_PowerEle_fill,E_PowerEle.E_PowerEle_avatar,E_PowerEle.E_PowerEle_refine,E_PowerEle.E_PowerEle_plantseed,E_PowerEle.E_PowerEle_armor,E_PowerEle.E_PowerEle_awaken,E_PowerEle.E_PowerEle_gene,E_PowerEle.E_PowerEle_puppet,E_PowerEle.E_PowerEle_equip,E_PowerEle.E_PowerEle_guildskill,E_PowerEle.E_PowerEle_wtree,E_PowerEle.E_PowerEle_nutri,E_PowerEle.E_PowerEle_lab,E_PowerEle.E_PowerEle_vip,E_PowerEle.E_PowerEle_suit,E_PowerEle.E_PowerEle_arena,E_PowerEle.E_PowerEle_balancepk,E_PowerEle.E_PowerEle_melee,E_PowerEle.E_PowerEle_worldboss,E_PowerEle.E_PowerEle_evolve];
      
      public static const Attr_Attack:int = 1;
      
      public static const Attr_Defense:int = 2;
      
      public static const Attr_HP:int = 3;
      
      public static const Attr_Ability:int = 5;
      
      public static const Attr_Hit:int = 6;
      
      public static const Attr_Dodge:int = 7;
      
      public static const Attr_Critical:int = 8;
      
      public static const Attr_Tough:int = 9;
       
      
      public function ConstGlobal()
      {
         super();
      }
   }
}
