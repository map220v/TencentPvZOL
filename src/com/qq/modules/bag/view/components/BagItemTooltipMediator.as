package com.qq.modules.bag.view.components
{
   import PVZ.Cmd.Dto_ItemInfo;
   import asgui.serialization.base64.Base64Util;
   import com.qq.GameGloble;
   import com.qq.modules.bag.ItemQualityType;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.bag.model.vo.BagItemVO;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.templates.font.FontNormal;
   import com.tencent.protobuf.Int64;
   import flash.utils.ByteArray;
   import tencent.base.utils.StringUtil;
   
   public class BagItemTooltipMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:BagItemTooltip;
      
      [Inject]
      public var bagProxy:BagProxy;
      
      public function BagItemTooltipMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
      }
      
      public function update(param1:Int64) : void
      {
         var _loc2_:BagItemVO = this.bagProxy.getItemByUID(param1);
         this.updateInfo(_loc2_);
      }
      
      public function updateDto(param1:String) : void
      {
         var _loc2_:ByteArray = Base64Util.decode(param1.slice(4));
         _loc2_.position = 0;
         var _loc3_:Dto_ItemInfo = new Dto_ItemInfo();
         _loc3_.mergeFrom(_loc2_);
         this.updateInfo(BagItemVO.createByItemInfo(_loc3_));
      }
      
      public function updateInfo(param1:BagItemVO) : void
      {
         if(!param1)
         {
            return;
         }
         this.view.itemName = param1.template.name;
         this.view.txtName.SetStyle("color",ItemQualityType.getQualityColor(param1.template.quality));
         var _loc2_:int = 0;
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc5_:String = "";
         if(param1.template.type == ItemType.TYPE_EQUIP)
         {
         }
         this.view.starLv = _loc2_;
         this.view.equipAttr = _loc3_;
         this.view.suitAttr = _loc5_;
         this.view.suitInfo = _loc4_;
         this.view.txtDesc.textField.htmlText = param1.template.desc;
         this.view.txtDesc.htmlText = param1.template.desc;
         if(GameGloble.actorModel.actorLevel < param1.template.minLvRequired)
         {
            this.view.txtDesc.htmlText += StringUtil.substitute(FontNormal.BAG_RequireLevelTip,param1.template.minLvRequired);
         }
         this.view.layout();
      }
      
      private function getSuitInfoText(param1:int, param2:Boolean) : String
      {
         if(param2)
         {
            return "<font color=\'#FFFFFF\'>" + ItemTemplateFactory.instance.getBagItemTemplateById(param1).name + "</font>\n";
         }
         return "<font color=\'#828383\'>" + ItemTemplateFactory.instance.getBagItemTemplateById(param1).name + "</font>\n";
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
