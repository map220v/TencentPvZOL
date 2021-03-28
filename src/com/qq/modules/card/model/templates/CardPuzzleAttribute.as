package com.qq.modules.card.model.templates
{
   import com.qq.templates.font.FontNormal;
   
   public class CardPuzzleAttribute
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
      
      public static const START:uint = 0;
      
      public static const END:uint = 11;
      
      private static const BASE_ATTRIBUTE:Array = [ATTACK,DEFENSE,ABILITY,HP];
       
      
      private var m_vecAttribute:Vector.<Number>;
      
      public function CardPuzzleAttribute()
      {
         super();
         this.m_vecAttribute = new Vector.<Number>(END);
      }
      
      public static function getAttributeName(param1:int) : String
      {
         var _loc2_:String = "ATTRIBUTE_" + param1;
         return String(FontNormal[_loc2_]);
      }
      
      public function setAttribute(param1:uint, param2:Number) : void
      {
         if(this.existAttribute(param1))
         {
            this.m_vecAttribute[param1] = param2;
         }
      }
      
      public function getAttribute(param1:uint) : Number
      {
         var _loc2_:Number = 0;
         if(this.existAttribute(param1))
         {
            _loc2_ = this.m_vecAttribute[param1];
         }
         return _loc2_;
      }
      
      public function existAttribute(param1:uint) : Boolean
      {
         return param1 > START && param1 < END;
      }
      
      public function get attributeShowString() : String
      {
         var _loc1_:Array = this.attributeShowList;
         if(_loc1_.length > 0)
         {
            return _loc1_.join(",");
         }
         return "";
      }
      
      public function get attributeShowList() : Array
      {
         var _loc2_:Number = NaN;
         var _loc1_:Array = [];
         var _loc3_:int = START + 1;
         while(_loc3_ < END)
         {
            _loc2_ = this.m_vecAttribute[_loc3_];
            if(_loc2_ > 0)
            {
               if(BASE_ATTRIBUTE.indexOf(_loc3_) >= 0)
               {
                  _loc2_ /= 100;
               }
               _loc1_.push(getAttributeName(_loc3_) + "+" + _loc2_.toFixed(0));
            }
            _loc3_++;
         }
         return _loc1_;
      }
   }
}
