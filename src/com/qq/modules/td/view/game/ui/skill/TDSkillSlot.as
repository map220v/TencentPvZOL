package com.qq.modules.td.view.game.ui.skill
{
   import asgui.core.IToolTipable;
   import asgui.core.UIComponent;
   import asgui.resources.AssetManager;
   import com.qq.modules.basic.view.MixLayer;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.view.game.layer.TDBasicLayer;
   import com.qq.utils.UIFactory;
   import com.qq.utils.UtilsManager;
   import com.qq.utils.ui.MixTextField;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Matrix;
   
   public class TDSkillSlot extends TDBasicLayer implements IToolTipable
   {
       
      
      public var cardState:TDCardData;
      
      public var priceTF:MixTextField;
      
      public var plantInfo:TDPlantStaticInfo;
      
      public var iconLayer:MixLayer;
      
      public var cooldownSp:TDBasicLayer;
      
      public var disableSp:TDBasicLayer;
      
      public var iconLoader:Object;
      
      private var _cid:int;
      
      public function TDSkillSlot(param1:TDCardData)
      {
         super();
         this.cardState = param1;
         var _loc2_:BitmapData = AssetManager.instance.GetClass("TD_UI_CardBG1") as BitmapData;
         var _loc3_:Bitmap = new Bitmap(_loc2_);
         _loc3_.name = "TD_UI_CardBG1";
         addComponentToLayer(_loc3_);
         addComponentToLayer(this.iconLayer = new MixLayer());
         this.onFinshLoadIcon(null);
         this.cooldownSp = new TDBasicLayer();
         this.cooldownSp.setVisible(false);
         _loc2_ = new BitmapData(_loc3_.width,_loc3_.height,false,0);
         var _loc4_:Bitmap;
         (_loc4_ = new Bitmap(_loc2_)).alpha = 0.3;
         this.cooldownSp.addComponentToLayer(_loc4_);
         this.cooldownSp.setVisible(false);
         addComponentToLayer(this.cooldownSp);
         this.disableSp = new TDBasicLayer();
         _loc2_ = new BitmapData(_loc3_.width,_loc3_.height,false,0);
         var _loc5_:Bitmap;
         (_loc5_ = new Bitmap(_loc2_)).alpha = 0.3;
         this.disableSp.addComponentToLayer(_loc5_);
         this.disableSp.setVisible(false);
         addComponentToLayer(this.disableSp);
         _loc2_ = AssetManager.instance.GetNewClass("TD_UI_CardBar") as BitmapData;
         _loc3_ = new Bitmap(_loc2_);
         _loc3_.name = "TD_UI_CardBar";
         _loc3_.x = 3;
         _loc3_.y = this.height - _loc3_.height - 3;
         addComponentToLayer(_loc3_);
         this.priceTF = UIFactory.createMixTextField(3,52,this.width - 5,20,"center",16514962,14,".TXT_TD_Card");
         addComponentToLayer(this.priceTF);
         this._cid = UIComponent.cidCounter++;
         this.graphics.beginFill(16711680,0);
         this.graphics.drawRect(0,0,this.width,this.height);
         this.graphics.endFill();
         this.buttonMode = true;
      }
      
      public function get cid() : uint
      {
         return this._cid;
      }
      
      public function setCooldown(param1:Number) : void
      {
         this.cooldownSp.display.scaleY = param1;
      }
      
      private function onFinshLoadIcon(param1:Event) : void
      {
         var _loc2_:Class = AssetManager.GetClass("card_icon_" + this.cardState.plantStaticInfo.baseInfo.iconID);
         var _loc3_:MovieClip = new _loc2_() as MovieClip;
         _loc3_.scaleX = _loc3_.scaleY = 0.5;
         var _loc4_:BitmapData;
         (_loc4_ = new BitmapData(54,72,true,16711680)).draw(_loc3_,new Matrix(0.5,0,0,0.5,-3,2));
         this.iconLoader = new Bitmap(_loc4_);
         this.iconLayer.addComponentToLayer(this.iconLoader,false,false,"card_icon_" + this.cardState.plantStaticInfo.baseInfo.iconID);
      }
      
      override public function Dispose() : void
      {
         this.cardState = null;
         UtilsManager.removeFromContainer(this.iconLoader);
         super.Dispose();
      }
   }
}
