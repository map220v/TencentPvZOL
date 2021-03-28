package com.qq.modules.main.model.vo
{
   import PVZ.Cmd.Dto_Buff_Info;
   import com.qq.modules.main.model.templates.BuffTemplate;
   import com.qq.modules.main.model.templates.BuffTemplateFactory;
   import com.qq.utils.DateUtils;
   
   public class BuffVO
   {
       
      
      private var _dto:Dto_Buff_Info;
      
      private var _buffTemplae:BuffTemplate;
      
      public function BuffVO(param1:Dto_Buff_Info)
      {
         super();
         this.loadDto(param1);
      }
      
      public function get dto() : Dto_Buff_Info
      {
         return this._dto;
      }
      
      public function get buffID() : int
      {
         return this._dto.buffId;
      }
      
      public function get buffType() : int
      {
         return this.buffTemplate.type;
      }
      
      public function loadDto(param1:Dto_Buff_Info) : void
      {
         this._dto = param1;
         this._buffTemplae = null;
      }
      
      public function get remainingTime() : int
      {
         return this._dto.endTime - DateUtils.getInstance().getServerTime();
      }
      
      public function get buffTemplate() : BuffTemplate
      {
         if(!this._buffTemplae)
         {
            this._buffTemplae = BuffTemplateFactory.instance.getBuffTemplate(this._dto.buffId);
         }
         return this._buffTemplae;
      }
   }
}
