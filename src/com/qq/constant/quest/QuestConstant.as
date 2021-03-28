package com.qq.constant.quest
{
   import com.qq.templates.font.FontNormal;
   
   public class QuestConstant
   {
      
      public static const unfinished:int = 2;
      
      public static const receive:int = 3;
      
      public static const finished:int = 4;
      
      public static const Type_Trunk:int = 1;
      
      public static const Type_Branch:int = 2;
      
      public static const Type_Daily:int = 3;
      
      public static const Type_ACT:int = 4;
      
      public static var needUpdateActData:Boolean = false;
       
      
      public function QuestConstant()
      {
         super();
      }
      
      public static function getQuestTypeName(param1:int, param2:Boolean = false) : String
      {
         var _loc3_:String = null;
         if(param2)
         {
            switch(param1)
            {
               case Type_Trunk:
                  _loc3_ = FontNormal.Quest_Main_Type_Easy;
                  break;
               case Type_Branch:
                  _loc3_ = FontNormal.Quest_Branch_Type_Easy;
                  break;
               case Type_Daily:
                  _loc3_ = FontNormal.Quest_Daily_Type_Easy;
                  break;
               default:
                  _loc3_ = FontNormal.Quest_Act_Type_Easy;
            }
         }
         else
         {
            switch(param1)
            {
               case Type_Trunk:
                  _loc3_ = FontNormal.Quest_Main_Type;
                  break;
               case Type_Branch:
                  _loc3_ = FontNormal.Quest_Branch_Type;
                  break;
               case Type_Daily:
                  _loc3_ = FontNormal.Quest_Daily_Type;
                  break;
               default:
                  _loc3_ = FontNormal.Quest_Act_Type;
            }
         }
         return _loc3_;
      }
   }
}
