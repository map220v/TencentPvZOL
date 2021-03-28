package com.qq.modules.td.view.components
{
   import com.qq.constant.td.TDConstant;
   import com.qq.display.avater.QTDPlantAvatar;
   import com.qq.display.avater.QTDZombieAvater;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.qzoneShare.command.QZoneShareCmd;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.game.unit.TDZombieStaticInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TDInstrustationWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDInstrustationWindow;
      
      private var _name:String;
      
      private var _desc:String;
      
      private var _tip:String;
      
      private var _stageID:int;
      
      private var _isPlant:Boolean;
      
      private var _type:int;
      
      public function TDInstrustationWindowMediator()
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
         addComponentListener(this.view.button_ok,MouseEvent.CLICK,this.onClick);
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc4_:TDPlantStaticInfo = null;
         var _loc5_:TDZombieStaticInfo = null;
         super.reset(param1);
         this._type = param1.type;
         var _loc2_:int = param1.id;
         var _loc3_:String = "";
         if(this._type == TDConstant.UnitCatalog_Plant)
         {
            _loc4_ = TDDataFactory.instance.getPlantInfoByID(_loc2_);
            this._name = _loc4_.baseInfo.name;
            this._desc = _loc4_.baseInfo.desc;
            this._stageID = _loc4_.stageId;
            this.view.reviewer = new QTDPlantAvatar();
            this.view.reviewer.x = 130;
            this.view.reviewer.y = 170;
            _loc3_ = FontHKHB.TDInstrustation_Titile_NewPlant;
            this._tip = _loc4_.baseInfo.introduction;
            QZoneShareCmd.checkTDShareMsg(TDStageInfo.getInstance().stageID,TDStageInfo.getInstance().levelID,TDStageInfo.getInstance().subLevelID,1,this.view.button_ok,null);
         }
         else if(this._type == TDConstant.UnitCatalog_Zombie)
         {
            _loc5_ = TDDataFactory.instance.getZombieInfoByID(_loc2_);
            this._name = _loc5_.name;
            this._desc = _loc5_.desc;
            this._stageID = _loc5_.stageID;
            this.view.reviewer = new QTDZombieAvater();
            this.view.reviewer.x = 130;
            this.view.reviewer.y = 200;
            _loc3_ = FontHKHB.TDInstrustation_Titile_NewZombie;
            this._tip = _loc5_.introduction;
         }
         if(this._name != null)
         {
            this.view.label_name.text = this._name;
            this.view.textarea_desc.text = this._desc;
            this.view.image_reviewBG.source = UrlManager.getInstance().getUrl(UrlManager.Url_TD_Intro,this._stageID + ".png");
            this.view.reviewer.setData(_loc2_);
            this.view.addChild(this.view.reviewer);
            this.view.title = _loc3_;
            this.view.textarea_tip.text = this._tip;
         }
      }
      
      private function onClick(param1:Event) : void
      {
         this.view.Close();
      }
      
      override public function dispose() : void
      {
         if(this._type == TDConstant.UnitCatalog_Plant)
         {
            TDEffectCmd.playRewardEndAnimation();
         }
         TDGameCmd.resumeGame();
         super.dispose();
      }
   }
}
