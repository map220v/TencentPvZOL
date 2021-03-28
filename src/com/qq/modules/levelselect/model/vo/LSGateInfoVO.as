package com.qq.modules.levelselect.model.vo
{
   import com.qq.modules.levelselect.model.templates.LSGateTemplate;
   import com.qq.modules.levelselect.model.templates.LSGateTemplateFactory;
   
   public class LSGateInfoVO
   {
       
      
      public var stageId:int;
      
      public var levelId:uint;
      
      public var subLevelId:uint;
      
      public var unlocked:Boolean = false;
      
      public var visible:Boolean;
      
      private var _template:LSGateTemplate;
      
      public function LSGateInfoVO(param1:int, param2:int, param3:int = 1)
      {
         super();
         this.stageId = param1;
         this.levelId = param2;
         this.subLevelId = param3;
      }
      
      public function get template() : LSGateTemplate
      {
         if(this._template == null)
         {
            this._template = LSGateTemplateFactory.instance.getTemplateByStageIdAndLevelId(this.stageId,this.levelId,this.subLevelId);
         }
         return this._template;
      }
   }
}
