package com.qq.modules.td.view.chooseCard.friendCard
{
   import asgui.core.IDisposable;
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.model.vo.TDDataVO;
   import com.qq.modules.td.model.vo.TDFriendCardInfo;
   import com.qq.modules.td.view.chooseCard.selfCard.TDBasicChooseCard;
   import com.qq.modules.td.view.chooseCard.ui.TDFriendCardTile;
   import com.qq.modules.td.view.chooseCard.ui.TDInviteFriendBtn;
   import com.qq.utils.CommandDispatcher;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   
   public class TDFriendCardListPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDFriendCardListPanel;
      
      [Inject]
      public var tdDataVO:TDDataVO;
      
      public function TDFriendCardListPanelMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         addContextListener(CommandName.TDGameEvent_EnterChooseFriendCardScreen,this.onEnterChooseFriendCardScreen,CommonEvent);
         addContextListener(CommandName.TD_CancelChooseFriendCard,this.onCancelChooseCard,CommonEvent);
      }
      
      public function setCard(param1:Vector.<TDCardData>, param2:Vector.<int>) : void
      {
         var _loc4_:int = 0;
         var _loc5_:TDBasicChooseCard = null;
         var _loc6_:TDFriendCardTile = null;
         var _loc7_:TDInviteFriendBtn = null;
         this.cleanCardInfo();
         param1 = param1.concat();
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            if(param2.indexOf(int(param1[_loc4_].plantStaticInfo.type)) != -1)
            {
               param1.splice(_loc4_,1);
               _loc4_--;
            }
            _loc4_++;
         }
         _loc3_ = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new TDChooseFriendCard(param1[_loc4_]);
            _loc6_ = new TDFriendCardTile();
            this.view.addChild(_loc6_);
            _loc6_.reset(_loc5_);
            _loc4_++;
         }
         if(_loc3_ == 0)
         {
            _loc7_ = new TDInviteFriendBtn();
            this.view.addChild(_loc7_);
         }
      }
      
      private function getCardPosByType(param1:TDCardData) : Point
      {
         var _loc2_:Point = null;
         var _loc3_:int = 0;
         var _loc5_:TDFriendCardTile = null;
         var _loc6_:TDBasicChooseCard = null;
         var _loc4_:int = this.view.numChildren;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(_loc5_ = this.view.getChildAt(_loc3_) as TDFriendCardTile)
            {
               if((_loc6_ = _loc5_.friendCard).cardData.id == param1.id)
               {
                  _loc2_ = new Point();
                  _loc2_.x = _loc6_.x;
                  _loc2_.y = _loc6_.y;
                  _loc2_ = _loc6_.localToGlobal(_loc2_);
                  break;
               }
            }
            _loc3_++;
         }
         if(_loc2_ == null)
         {
            _loc2_ = this.view.localToGlobal(new Point(0,0));
         }
         return _loc2_;
      }
      
      private function cleanCardInfo() : void
      {
         while(this.view.numChildren > 0)
         {
            (this.view.removeChildAt(0) as IDisposable).Dispose();
         }
      }
      
      private function onEnterChooseFriendCardScreen(param1:Event) : void
      {
         var _loc5_:TDFriendCardInfo = null;
         var _loc2_:Vector.<TDCardData> = new Vector.<TDCardData>();
         var _loc3_:int = this.tdDataVO.friendInfoList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this.tdDataVO.friendInfoList[_loc4_];
            _loc2_.push(new TDCardData(_loc5_.friendInfo.plantInfo,_loc5_));
            _loc4_++;
         }
         this.setCard(_loc2_,TDStageInfo.getInstance().banSkillPlant);
      }
      
      private function onCancelChooseCard(param1:CommonEvent) : void
      {
         var _loc4_:Point = null;
         var _loc5_:Bitmap = null;
         var _loc6_:BitmapData = null;
         var _loc7_:Point = null;
         var _loc2_:TDBasicChooseCard = param1.readCustomParam("chooseCard") as TDBasicChooseCard;
         var _loc3_:int = param1.readCustomParam("needFly");
         _loc3_ = _loc3_ == 0 ? 1 : int(_loc3_);
         _loc3_ = _loc3_ == -1 ? 0 : int(_loc3_);
         if(!_loc2_)
         {
            getLogger("TD").debug("没有选中的卡片");
            return;
         }
         _loc4_ = new Point();
         (_loc6_ = new BitmapData(_loc2_.width,_loc2_.height,true,16711680)).draw(_loc2_);
         _loc5_ = new Bitmap(_loc6_);
         _loc4_.x = _loc2_.x;
         _loc4_.y = _loc2_.y;
         _loc4_ = _loc2_.parent.localToGlobal(_loc4_);
         _loc7_ = this.getCardPosByType(_loc2_.cardData);
         TDGameInfo.getInstance().removeCardFromSlot(_loc2_.cardData);
         TDSoundCmd.restorePlantCard();
         var _loc8_:Object;
         (_loc8_ = new Object()).obj = _loc5_;
         _loc8_.fromPoint = _loc4_;
         _loc8_.targetPoint = _loc7_;
         _loc8_.needFly = _loc3_;
         CommandDispatcher.send(CommandName.TD_PlayCancelChooseCardEffect,_loc8_);
      }
   }
}
