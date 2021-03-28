package com.qq.modules.activity.view
{
   import com.qq.modules.activity.view.components.ActivityItemTooptip;
   import com.qq.modules.bag.ItemQualityType;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.basic.view.BasicScreenMediator;
   
   public class ActivityItemTooptipMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:ActivityItemTooptip;
      
      public function ActivityItemTooptipMediator()
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
      
      public function updateInfo(param1:ItemVO) : void
      {
         this.view.itemName = param1.template.name;
         this.view.txtName.SetStyle("color",ItemQualityType.getQualityColor(param1.template.quality));
         var _loc2_:int = 0;
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc5_:String = "";
         this.view.starLv = _loc2_;
         this.view.equipAttr = _loc3_;
         this.view.suitAttr = _loc5_;
         this.view.suitInfo = _loc4_;
         this.view.txtDesc.htmlText = param1.template.desc;
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
   }
}
