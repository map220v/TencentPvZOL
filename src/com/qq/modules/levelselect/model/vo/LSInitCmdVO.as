package com.qq.modules.levelselect.model.vo
{
   public class LSInitCmdVO
   {
       
      
      public var cmdType:int;
      
      public var value:Object;
      
      public var stageId:int;
      
      public var levelId:int;
      
      public var subLevelId:int;
      
      public function LSInitCmdVO(param1:int, param2:Object, param3:Object = null)
      {
         super();
         this.value = param3;
         this.cmdType = param1;
         if(param2 is Array)
         {
            this.stageId = param2[0];
            this.levelId = param2[1];
            this.subLevelId = param2[2];
         }
      }
   }
}
