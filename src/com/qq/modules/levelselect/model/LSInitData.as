package com.qq.modules.levelselect.model
{
   import com.qq.modules.levelselect.model.vo.LSInitCmdVO;
   
   public class LSInitData
   {
       
      
      public var cmds:Vector.<LSInitCmdVO>;
      
      public function LSInitData()
      {
         this.cmds = new Vector.<LSInitCmdVO>();
         super();
      }
      
      public function addCmd(param1:int, param2:Object, param3:Object = null) : void
      {
         this.cmds.push(new LSInitCmdVO(param1,param2,param3));
      }
   }
}
