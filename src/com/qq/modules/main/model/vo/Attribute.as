package com.qq.modules.main.model.vo
{
   import com.qq.templates.font.FontNormal;
   import flash.utils.Dictionary;
   
   public class Attribute
   {
      
      public static const ATTACK:uint = 1;
      
      public static const DEFENSE:uint = 2;
      
      public static const HP:uint = 3;
      
      public static const SHIELD:uint = 4;
      
      public static const ABILITY:uint = 5;
      
      public static const HIT:uint = 6;
      
      public static const DODGE:uint = 7;
      
      public static const CRITICAL:uint = 8;
      
      public static const TOUGH:uint = 9;
      
      public static const IMMUNE:uint = 10;
      
      public static const PERCENT_ATTACK:uint = 11;
      
      public static const PERCENT_DEFENSE:uint = 12;
      
      public static const PERCENT_HP:uint = 13;
      
      public static const PERCENT_SHIELD:uint = 14;
      
      public static const PERCENT_ABILITY:uint = 15;
      
      public static const PERCENT_HIT:uint = 16;
      
      public static const PERCENT_DODGE:uint = 17;
      
      public static const PERCENT_CRITICAL:uint = 18;
      
      public static const PERCENT_TOUGH:uint = 19;
      
      public static const PERCENT_IMMUNE:uint = 20;
      
      private static const ATTRIBUTE_BEGIN:uint = 0;
      
      private static const ATTRIBUTE_END:uint = 21;
       
      
      protected var m_vecType:Vector.<int>;
      
      protected var m_dicValue:Dictionary;
      
      public function Attribute()
      {
         super();
         this.m_vecType = new Vector.<int>();
         this.m_dicValue = new Dictionary();
      }
      
      public static function checkNeedTransform(param1:int) : Boolean
      {
         switch(param1)
         {
            case ATTACK:
            case DEFENSE:
            case HP:
            case ABILITY:
               return true;
            default:
               return false;
         }
      }
      
      public static function getNormalFontAttributeName(param1:int) : String
      {
         var _loc2_:String = "ATTRIBUTE_" + param1;
         return String(FontNormal[_loc2_]);
      }
      
      public function reset() : void
      {
         var _loc1_:int = 0;
         for each(_loc1_ in this.m_vecType)
         {
            delete this.m_dicValue[_loc1_];
         }
         this.m_vecType.length = 0;
      }
      
      public final function get allType() : Vector.<int>
      {
         return this.m_vecType;
      }
      
      public final function getAttribute(param1:int, param2:Boolean = false) : Number
      {
         var _loc3_:Number = NaN;
         if(this.m_dicValue.hasOwnProperty(param1))
         {
            _loc3_ = this.m_dicValue[param1];
            if(param2 && checkNeedTransform(param1))
            {
               _loc3_ /= 100;
            }
            return _loc3_;
         }
         return 0;
      }
      
      public final function mergeAttribute(param1:Attribute) : void
      {
         var _loc2_:int = 0;
         for each(_loc2_ in param1.allType)
         {
            this.addAttribute(_loc2_,param1.getAttribute(_loc2_));
         }
      }
      
      public final function addAttribute(param1:int, param2:Number) : void
      {
         this.setAttribute(param1,this.getAttribute(param1) + param2);
      }
      
      public final function setAttribute(param1:int, param2:Number) : void
      {
         if(param1 > ATTRIBUTE_BEGIN && param1 < ATTRIBUTE_END)
         {
            if(this.m_vecType.indexOf(param1) < 0)
            {
               this.m_vecType.push(param1);
            }
            this.m_dicValue[param1] = param2;
         }
      }
   }
}
