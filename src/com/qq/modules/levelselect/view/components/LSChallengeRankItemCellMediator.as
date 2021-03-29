package com.qq.modules.levelselect.view.components
{
   import com.qq.GameGloble;
   import com.qq.constant.ls.LSConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.modules.rank.RankGlobal;
   import com.qq.modules.rank.model.RankRecordVO;
   import com.qq.utils.CommandDispatcher;
   import com.tencent.protobuf.Int64;
   import flash.events.MouseEvent;
   
   public class LSChallengeRankItemCellMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSChallengeRankItemCell;
      
      private var _roleId:Int64;
      
      public function LSChallengeRankItemCellMediator()
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
         addContextListener(LSConstant.LS_CHALLENGE_RANK_CELL_SELECT,this.onRankCellSelect,CommonEvent);
      }
      
      private function onNameClick(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         MapInfoViewCmd.showMapRoleWndByRoleId(this._roleId);
      }
      
      private function onViewClick(param1:MouseEvent) : void
      {
         CommandDispatcher.send(LSConstant.LS_CHALLENGE_RANK_CELL_SELECT,this.view);
      }
      
      private function onRankCellSelect(param1:CommonEvent) : void
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
         var _loc2_:RankRecordVO = null;
         var _loc3_:Date = null;
         super.reset(param1);
         if(param1)
         {
            _loc2_ = param1 as RankRecordVO;
            this._roleId = _loc2_.roleID;
            this.view.setRank(_loc2_.getData(RankGlobal.PROPERTY_INDEX) as uint);
            this.view.setBGFrame((_loc2_.getData(RankGlobal.PROPERTY_INDEX) as uint) % 3 + 1);
            this.view.l_name.text = _loc2_.getData(RankGlobal.PROPERTY_ROLE).toString();
            this.view.l_level.text = _loc2_.getData(RankGlobal.PROPERTY_LEVEL).toString();
            this.view.l_score.text = _loc2_.getData(RankGlobal.PROPERTY_ACHIEVE).toString();
            _loc3_ = new Date();
            _loc3_.time = uint(_loc2_.getData(RankGlobal.PROPERTY_DATE)) * 1000;
            this.view.l_date.text = _loc3_.fullYear + "-" + (_loc3_.month + 1) + "-" + _loc3_.date + " " + _loc3_.hours + ":" + _loc3_.minutes + ":" + _loc3_.seconds;
            if(this._roleId.compare(GameGloble.actorModel.roleId))
            {
               this.view.l_rank.SetStyle("color","#ffff00");
               this.view.l_name.SetStyle("color","#ffff00");
               this.view.l_level.SetStyle("color","#ffff00");
               this.view.l_score.SetStyle("color","#ffff00");
               this.view.l_date.SetStyle("color","#ffff00");
            }
            else
            {
               this.view.l_rank.SetStyle("color","#ffffff");
               this.view.l_name.SetStyle("color","#ffffff");
               this.view.l_level.SetStyle("color","#ffffff");
               this.view.l_score.SetStyle("color","#ffffff");
               this.view.l_date.SetStyle("color","#ffffff");
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
