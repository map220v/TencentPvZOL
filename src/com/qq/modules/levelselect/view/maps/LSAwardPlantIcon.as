package com.qq.modules.levelselect.view.maps
{
   import asgui.core.IDisposable;
   import asgui.managers.ToolTipManager;
   import com.qq.data.DataCacheManager;
   import com.qq.display.CardIcon;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.utils.db.ClientDBTableName;
   import flash.display.Sprite;
   
   public class LSAwardPlantIcon extends Sprite implements IDisposable
   {
       
      
      private var icon:CardIcon;
      
      public function LSAwardPlantIcon()
      {
         super();
         this.icon = new CardIcon();
         addChild(this.icon);
      }
      
      public function set plantId(param1:Number) : void
      {
         this.icon.setCardIconByPlantId(param1,CardTemplateFactory.instance.getPlantDefaultAvatarID(param1));
         this.icon.scaleX = this.icon.scaleY = 0.75;
         var _loc2_:TDPlantBaseStaticInfo = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantTypeInfo,param1,TDPlantBaseStaticInfo);
         ToolTipManager.RegisterToolTip(this,_loc2_.name);
      }
      
      public function Dispose() : void
      {
         ToolTipManager.RegisterToolTip(this,null);
         if(this.icon)
         {
            this.icon.Dispose();
            this.icon = null;
         }
      }
      
      public function get hasDisposed() : Boolean
      {
         return false;
      }
   }
}
