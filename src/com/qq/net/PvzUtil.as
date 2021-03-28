package com.qq.net
{
   import PVZ.CmdConst;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.tencent.protobuf.Message;
   import flash.utils.ByteArray;
   
   public class PvzUtil
   {
       
      
      public function PvzUtil()
      {
         super();
      }
      
      public static function copyMessage(param1:Message) : Message
      {
         var _loc2_:ByteArray = new ByteArray();
         param1.writeTo(_loc2_);
         _loc2_.position = 0;
         var _loc3_:Class = CmdConst.getClassByName(param1.$messageID);
         var _loc4_:Message;
         (_loc4_ = new _loc3_() as Message).mergeFrom(_loc2_);
         return _loc4_;
      }
      
      public static function sortCardArr(param1:Vector.<CardItemVO>) : Vector.<CardItemVO>
      {
         return param1.sort(sortCardFunction);
      }
      
      private static function sortCardFunction(param1:CardItemVO, param2:CardItemVO) : Number
      {
         if(param1.power > param2.power)
         {
            return -1;
         }
         if(param1.power < param2.power)
         {
            return 1;
         }
         return 0;
      }
   }
}
