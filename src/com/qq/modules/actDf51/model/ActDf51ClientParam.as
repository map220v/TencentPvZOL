package com.qq.modules.actDf51.model
{
   import asgui.serialization.json.JSON;
   import org.as3commons.logging.api.getLogger;
   
   public class ActDf51ClientParam
   {
       
      
      public var actId:uint;
      
      public var steps:Vector.<ActDf51ClientStepVo>;
      
      public function ActDf51ClientParam(param1:String, param2:uint)
      {
         var obj:Object = null;
         var step:ActDf51ClientStepVo = null;
         var stepObj:Object = null;
         var value:String = param1;
         var actId:uint = param2;
         super();
         this.actId = actId;
         this.steps = new Vector.<ActDf51ClientStepVo>();
         try
         {
            obj = asgui.serialization.json.JSON.deserialize(value);
            for each(stepObj in obj["steps"])
            {
               step = new ActDf51ClientStepVo(stepObj);
               this.steps.push(step);
            }
         }
         catch(e:Error)
         {
            getLogger().debug(e);
         }
      }
   }
}
