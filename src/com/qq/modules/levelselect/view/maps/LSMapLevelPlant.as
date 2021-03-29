package com.qq.modules.levelselect.view.maps
{
   import asgui.core.IDisposable;
   import asgui.managers.ToolTipManager;
   import com.qq.data.DataCacheManager;
   import com.qq.display.TDCardItem;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.utils.db.ClientDBTableName;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class LSMapLevelPlant extends Sprite implements IDisposable
   {
      
      private static const MIN:int = -10;
      
      private static const MAX:int = 10;
       
      
      private var initPos:Boolean;
      
      private var speed:Number = -0.5;
      
      private var ct:Sprite;
      
      private var cardItem:TDCardItem;
      
      private var _hasDisposed:Boolean;
      
      public function LSMapLevelPlant(param1:int, param2:Boolean = false)
      {
         super();
         var _loc3_:TDPlantBaseStaticInfo = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantTypeInfo,param1,TDPlantBaseStaticInfo);
         this.ct = new Sprite();
         this.cardItem = new TDCardItem();
         this.cardItem.setMaskBarVisible(false);
         this.cardItem.setCard(_loc3_.id,CardTemplateFactory.instance.getPlantDefaultAvatarID(_loc3_.id));
         this.cardItem.scaleX = this.cardItem.scaleY = 0.6;
         this.cardItem.x = 1;
         this.cardItem.y = -3;
         this.ct.addChild(this.cardItem);
         this.cardItem.drawSelfToBitmap();
         this.addChild(this.ct);
         ToolTipManager.RegisterToolTip(this,_loc3_.name);
         if(param2)
         {
            this.addEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         }
      }
      
      public function setNoBackground() : void
      {
         this.cardItem.setCardBJ(null);
      }
      
      protected function enterFrameHandler(param1:Event) : void
      {
         if(!this.initPos)
         {
            this.ct.y = MIN + (MAX - MIN) * Math.random();
            if(Math.random() > 0.5)
            {
               this.speed = -this.speed;
            }
            this.initPos = true;
         }
         this.ct.y += this.speed;
         if(this.ct.y > MAX || this.ct.y < MIN)
         {
            this.speed = -this.speed;
         }
      }
      
      public function Dispose() : void
      {
         if(this.cardItem)
         {
            this.cardItem.Dispose();
            this.cardItem = null;
         }
         ToolTipManager.RegisterToolTip(this,null);
         this.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
   }
}
