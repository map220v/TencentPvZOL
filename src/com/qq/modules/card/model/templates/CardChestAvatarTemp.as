package com.qq.modules.card.model.templates
{
   import PVZ.Cmd.Dto_IdNum;
   import com.qq.GameGloble;
   import com.qq.modules.card.model.templates.ce.CardChestAvatarTemplateCE;
   
   public class CardChestAvatarTemp extends CardChestAvatarTemplateCE
   {
       
      
      public var hideBonePVPList:Array;
      
      public var hideBoneTDList:Array;
      
      public var hidePartCardList:Array;
      
      public var unlockItem:Dto_IdNum;
      
      public var bindBonePVPList:Vector.<String>;
      
      public var bindBoneTDList:Vector.<String>;
      
      public var offsetY:int;
      
      public var hideBonePVP:String;
      
      public var bindBonePVP:String;
      
      public var hidePartCard:String;
      
      public var bindBoneTD:String;
      
      public var extraParam:String;
      
      public function CardChestAvatarTemp()
      {
         super();
      }
      
      override public function load(param1:Object) : void
      {
         super.load(param1);
         this.init();
      }
      
      public function isRare() : Boolean
      {
         return _avatarCatalog > 5;
      }
      
      public function updateCardVisibleBySameTdIdTemplates(param1:Vector.<CardChestAvatarTemp>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:CardChestAvatarTemp = null;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc9_:String = null;
         var _loc4_:Array = [];
         if(!this.hidePartCard)
         {
            while(_loc2_ < param1.length)
            {
               if((_loc5_ = param1[_loc2_]) != this && _loc5_.bindBonePVP != this.bindBonePVP)
               {
                  _loc6_ = _loc5_.bindBonePVP.split(";");
                  _loc3_ = 0;
                  while(_loc3_ < _loc6_.length)
                  {
                     if((_loc7_ = _loc6_[_loc3_]).length > 1)
                     {
                        if((_loc9_ = (_loc8_ = _loc7_.split("&"))[2]) && _loc9_.length > 0 && _loc4_.indexOf(_loc9_) == -1)
                        {
                           _loc4_.push(_loc9_);
                        }
                     }
                     _loc3_++;
                  }
               }
               _loc2_++;
            }
            if(this.hideBonePVPList)
            {
               _loc4_ = _loc4_.concat(this.hideBonePVPList);
            }
            if(this.hidePartCardList)
            {
               _loc4_ = _loc4_.concat(this.hidePartCardList);
            }
            this.hidePartCardList = _loc4_;
         }
      }
      
      private function parseAvatarDataStr(param1:String) : String
      {
         return param1.replace(/:/g,"&");
      }
      
      public function init() : void
      {
         var r:Array = null;
         var i:int = 0;
         var data:XML = null;
         var unlocks:Array = null;
         var r1:Array = null;
         data = GameGloble.avatarConfigXml.a.(@id == id)[0];
         if(data != null)
         {
            this.hideBonePVPList = this.parseAvatarDataStr(data.@hbPVP).split("|");
            this.hideBoneTDList = this.parseAvatarDataStr(data.@hbTD).split("|");
            this.hidePartCardList = this.parseAvatarDataStr(data.@hpCard).split("|");
            this.bindBonePVP = this.parseAvatarDataStr(data.@bbPVP);
            this.bindBoneTD = this.parseAvatarDataStr(data.@bbTD);
            this.extraParam = data.@eParam;
         }
         else
         {
            this.hideBonePVPList = new Array();
            this.hideBoneTDList = new Array();
            this.hidePartCardList = new Array();
            this.bindBonePVP = "";
            this.bindBoneTD = "";
            this.extraParam = "";
         }
         if(unLockItemStr)
         {
            unlocks = unLockItemStr.split(":");
            this.unlockItem = new Dto_IdNum();
            this.unlockItem.id = unlocks[0];
            this.unlockItem.num = unlocks[1];
         }
         if(!this.unlockItem)
         {
            this.unlockItem = new Dto_IdNum();
         }
         if(!this.bindBonePVPList)
         {
            r = this.bindBonePVP.split(";");
            this.bindBonePVPList = new Vector.<String>();
            i = 0;
            while(i < r.length)
            {
               if(r[i].length > 0)
               {
                  this.bindBonePVPList.push(r[i]);
               }
               i++;
            }
         }
         if(!this.bindBoneTDList)
         {
            r = this.bindBoneTD.split(";");
            this.bindBoneTDList = new Vector.<String>();
            i = 0;
            while(i < r.length)
            {
               if(r[i].length > 0)
               {
                  this.bindBoneTDList.push(r[i]);
               }
               i++;
            }
         }
         this.offsetY = 0;
         if(this.extraParam)
         {
            r = this.extraParam.split(";");
            i = 0;
            for(; i < r.length; i++)
            {
               if(r[i].length <= 0)
               {
                  continue;
               }
               r1 = String(r[i]).split(":");
               switch(r1[0])
               {
                  case "y":
                     this.offsetY = r1[1];
                     break;
               }
            }
         }
      }
   }
}
