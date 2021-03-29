package com.qq.modules.levelselect.view.components
{
   import com.qq.GameGloble;
   import com.qq.constant.ls.LSConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.model.templates.LSChallengeFactory;
   import com.qq.modules.levelselect.model.templates.ce.LSChallengeRankBonusTemplateCE;
   import com.qq.modules.levelselect.model.vo.LSChallengeLevelRankVO;
   import com.qq.utils.CommandDispatcher;
   import com.tencent.protobuf.Int64;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class LSChallengeLevelItemCellMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSChallengeLevelItemCell;
      
      private var _roleId:Int64;
      
      public function LSChallengeLevelItemCellMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.view.setSelected(false);
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view,MouseEvent.CLICK,this.onViewClick);
         addComponentListener(this.view.l_name,MouseEvent.CLICK,this.onNameClick);
         addContextListener(LSConstant.LS_CHALLENGE_LEVEL_CELL_SELECT,this.onLevelCellSelect,CommonEvent);
      }
      
      private function onNameClick(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         this.view.dispatchEvent(new Event(Event.SELECT));
      }
      
      private function onViewClick(param1:MouseEvent) : void
      {
         CommandDispatcher.send(LSConstant.LS_CHALLENGE_LEVEL_CELL_SELECT,this.view);
      }
      
      private function onLevelCellSelect(param1:CommonEvent) : void
      {
         if(this.view != param1.param)
         {
            this.view.setSelected(false);
         }
         else
         {
            this.view.setSelected(true);
         }
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc2_:LSChallengeLevelRankVO = null;
         var _loc3_:Vector.<LSChallengeRankBonusTemplateCE> = null;
         var _loc4_:int = 0;
         var _loc5_:Date = null;
         super.reset(param1);
         if(param1)
         {
            _loc2_ = param1 as LSChallengeLevelRankVO;
            if(_loc2_)
            {
               this._roleId = _loc2_.roleId;
               this.view.setRank(_loc2_.rank);
               this.view.setBGFrame(_loc2_.rank % 3 + 1);
               _loc3_ = LSChallengeFactory.instance.getAllrankBonus(_loc2_.stageId,_loc2_.levelId,_loc2_.subLevelId,_loc2_.challengeLevelId);
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  if(_loc3_[_loc4_].min <= _loc2_.rank && _loc2_.rank <= _loc3_[_loc4_].max)
                  {
                     this.view.setStageSource(_loc3_[_loc4_].id % 9);
                     break;
                  }
                  _loc4_++;
               }
               this.view.l_name.text = _loc2_.roleName;
               this.view.l_level.text = _loc2_.score.toString();
               (_loc5_ = new Date()).time = _loc2_.time * 1000;
               this.view.l_date.text = _loc5_.fullYear + "-" + (_loc5_.month + 1) + "-" + _loc5_.date + " " + _loc5_.hours + ":" + _loc5_.minutes + ":" + _loc5_.seconds;
               if(this._roleId.compare(GameGloble.actorModel.roleId))
               {
                  this.view.l_rank.SetStyle("color","#ffff00");
                  this.view.l_name.SetStyle("color","#ffff00");
                  this.view.l_level.SetStyle("color","#ffff00");
                  this.view.l_date.SetStyle("color","#ffff00");
               }
               else
               {
                  this.view.l_rank.SetStyle("color","#ffffff");
                  this.view.l_name.SetStyle("color","#ffffff");
                  this.view.l_level.SetStyle("color","#ffffff");
                  this.view.l_date.SetStyle("color","#ffffff");
               }
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
