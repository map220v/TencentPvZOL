package com.qq.modules.card.model.templates
{
   import PVZ.Cmd.Dto_IdNum;
   import com.qq.modules.card.model.templates.ce.CardChestForgeAvatarTemplateCE;
   
   public class CardChestForgeAvatarTemp extends CardChestForgeAvatarTemplateCE
   {
       
      
      public var useItem:Dto_IdNum;
      
      public function CardChestForgeAvatarTemp()
      {
         super();
      }
      
      override public function load(param1:Object) : void
      {
         super.load(param1);
         this.init();
      }
      
      public function init() : void
      {
         var _loc1_:Array = null;
         if(useItemStr)
         {
            _loc1_ = useItemStr.split(":");
            this.useItem = new Dto_IdNum();
            this.useItem.id = _loc1_[0];
            this.useItem.num = _loc1_[1];
         }
         if(!this.useItem)
         {
            this.useItem = new Dto_IdNum();
            this.useItem.id = 0;
            this.useItem.num = 0;
         }
      }
   }
}
