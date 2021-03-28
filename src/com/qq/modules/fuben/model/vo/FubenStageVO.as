package com.qq.modules.fuben.model.vo
{
   import PVZ.Cmd.Dto_Fuben_StageInfo;
   import com.qq.modules.fuben.model.templates.FubenTemplate;
   import com.qq.modules.fuben.model.templates.FubenTemplateFactory;
   import org.as3commons.logging.api.getLogger;
   
   public class FubenStageVO
   {
       
      
      public var levelId:int;
      
      public var maxHp:Number;
      
      public var curHp:Number;
      
      private var _template:FubenTemplate;
      
      private var dto:Dto_Fuben_StageInfo;
      
      private var _unlocked:Boolean = false;
      
      public function FubenStageVO(param1:int, param2:FubenTemplate = null)
      {
         super();
         this.levelId = param1;
         if(param2)
         {
            this._template = param2;
         }
      }
      
      public function get template() : FubenTemplate
      {
         if(this._template == null)
         {
            this._template = FubenTemplateFactory.instance.getFubenTemplateById(this.levelId);
         }
         return this._template;
      }
      
      public function loadDto(param1:Dto_Fuben_StageInfo) : void
      {
         this.dto = param1;
         this._unlocked = true;
         getLogger().debug("[FubenStageVO]\tstageid:" + param1.stageid + ", star:" + param1.star + ", times:" + param1.times);
      }
      
      public function clearDto() : void
      {
         this.dto = null;
         this._unlocked = false;
      }
      
      public function get hasDto() : Boolean
      {
         return this.dto != null;
      }
      
      public function get canSigleSweep() : Boolean
      {
         if(!this.dto)
         {
            return false;
         }
         return this.dto.canSingleSweep;
      }
      
      public function get canMultSweep() : Boolean
      {
         if(!this.dto)
         {
            return false;
         }
         return this.dto.canMultiSweep;
      }
      
      public function get multSweeptimes() : uint
      {
         if(!this.dto)
         {
            return 0;
         }
         return this.dto.multiSweeptTimes;
      }
      
      public function get times() : int
      {
         if(!this.dto)
         {
            return 0;
         }
         return this.dto.times;
      }
      
      public function get hasLimit() : Boolean
      {
         if(!this.dto)
         {
            return false;
         }
         return this.dto.hasLimit;
      }
      
      public function get star() : int
      {
         if(this.dto == null)
         {
            return 0;
         }
         return this.dto.star;
      }
      
      public function get hasPassed() : Boolean
      {
         return this.star > 0;
      }
      
      public function get unlocked() : Boolean
      {
         return this._unlocked;
      }
      
      public function get iconType() : int
      {
         return this.template.icon;
      }
      
      public function setUnlocked() : void
      {
         this._unlocked = true;
      }
      
      public function toString() : String
      {
         return "[FubenStageVO] unlocked:" + this.unlocked + ", " + "star:" + this.star;
      }
   }
}
