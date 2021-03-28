package com.qq.modules.actDf51.model
{
   import PVZ.Cmd.Dto_IdNum;
   import asgui.serialization.json.JSON;
   
   public class ActDf51ClientStepVo
   {
       
      
      public var score:uint;
      
      public var rewards:Vector.<Dto_IdNum>;
      
      public var time:String;
      
      public function ActDf51ClientStepVo(param1:Object = null)
      {
         var _loc2_:Dto_IdNum = null;
         var _loc3_:Object = null;
         super();
         if(!param1)
         {
            return;
         }
         this.score = param1.score;
         this.time = param1.time;
         this.rewards = new Vector.<Dto_IdNum>();
         for each(_loc3_ in param1["rewards"])
         {
            _loc2_ = new Dto_IdNum();
            _loc2_.id = _loc3_.id;
            _loc2_.num = _loc3_.num;
            this.rewards.push(_loc2_);
         }
      }
      
      public function initWithJson(param1:String) : void
      {
         var obj:Object = null;
         var idNum:Dto_IdNum = null;
         var items:Object = null;
         var value:String = param1;
         this.rewards = new Vector.<Dto_IdNum>();
         try
         {
            obj = asgui.serialization.json.JSON.deserialize(value);
            this.score = obj.score;
            this.time = obj.time;
            for each(items in obj["rewards"])
            {
               idNum = new Dto_IdNum();
               idNum.id = items.id;
               idNum.num = items.num;
               this.rewards.push(idNum);
            }
         }
         catch(e:Error)
         {
            score = 1;
         }
      }
   }
}
